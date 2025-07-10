// main

`include "define.v"

module measureClifford(
    input wire i_clk,
    input wire i_rst_n,
    input wire [2*`NUM_TOTAL_QUBITS - 1:0] i_basis,
    input wire [2*`NUM_TOTAL_QUBITS - 1:0] i_result,
    input wire i_setup,
    input wire i_back_setup,
    output wire [$clog2(`NUM_TOTAL_QUBITS) : 0] o_value,
    output wire o_is_zero,
    output wire o_is_neg,
    output wire o_ready
);
//==========================declare regs==========================
    reg [0 : 2*`NUM_TOTAL_QUBITS] tableau [0 : 2*`NUM_TOTAL_QUBITS-1];
    reg [0 : 2*`NUM_TOTAL_QUBITS] nxt_tableau [0 : 2*`NUM_TOTAL_QUBITS-1];
    reg [0 : 2*`NUM_TOTAL_QUBITS] tableau_setup [0 : 2*`NUM_TOTAL_QUBITS-1];
    reg [0 : 2*`NUM_TOTAL_QUBITS] nxt_tableau_setup [0 : 2*`NUM_TOTAL_QUBITS-1];
    reg [1 : 0] basis [0 : `NUM_TOTAL_QUBITS-1];
    reg [1 : 0] nxt_basis [0 : `NUM_TOTAL_QUBITS-1];
    reg [1 : 0] result [0 : `NUM_TOTAL_QUBITS-1];
    reg [2 : 0] state, nxt_state;
    reg [$clog2(`NUM_TOTAL_QUBITS) : 0] cnt2, nxt_cnt2;
    reg [$clog2(`NUM_TOTAL_QUBITS) : 0] cnt3, nxt_cnt3;
    reg [$clog2(`NUM_TOTAL_QUBITS) : 0] cnt2_j, nxt_cnt2_j;
    reg [$clog2(`NUM_TOTAL_QUBITS) : 0] first_row_idx, nxt_first_row_idx;
    reg [0 : 2*`NUM_TOTAL_QUBITS] first_row, nxt_first_row;
    reg [0 : 2*`NUM_TOTAL_QUBITS] ancilla, nxt_ancilla;
    reg [0 : 2*`NUM_TOTAL_QUBITS] row1_1, row2_1;
    reg [0 : 2*`NUM_TOTAL_QUBITS] row1_2, row2_2;
    reg [$clog2(`NUM_TOTAL_QUBITS) : 0] value, nxt_value;
    reg is_zero, nxt_is_zero;
    reg is_neg, nxt_is_neg;
    reg ready, nxt_ready;


//==========================declare params==========================
    integer i, j;
    genvar gi, gj;
// recover the flatten array
wire [1 : 0] i_basis_vec [0 : `NUM_TOTAL_QUBITS - 1];
wire [1 : 0] i_result_vec [0 : `NUM_TOTAL_QUBITS - 1];
for (gi=0;gi<`NUM_TOTAL_QUBITS;gi=gi+1) begin
    assign i_basis_vec[gi] = i_basis[2*gi +: 2];
    assign i_result_vec[gi] = i_result[2*gi +: 2];
end

//==========================declare wires==========================
    wire [0 : `NUM_TOTAL_QUBITS-1] wire_0 [0 : 2*`NUM_TOTAL_QUBITS-1];
    wire [0 : 2*`NUM_TOTAL_QUBITS] new_row_1, new_row_2;
    wire [0 : 2*`NUM_TOTAL_QUBITS] obs_row;
    wire [0 : `NUM_TOTAL_QUBITS-1] wire_1 [0 : 2*`NUM_TOTAL_QUBITS-1];
    wire [0 : 2*`NUM_TOTAL_QUBITS-1] IsCommute;
//==========================declare instances==========================
    row_sum u_row_sum_1(
        .row1(row1_1),
        .row2(row2_1),
        .new_row(new_row_1)
    );
    row_sum u_row_sum_2(
        .row1(row1_2),
        .row2(row2_2),
        .new_row(new_row_2)
    );
//==========================Assign==========================
    generate
        for(gi=0;gi<2*`NUM_TOTAL_QUBITS;gi=gi+1) begin : gen_wire_0
            for(gj=0;gj<`NUM_TOTAL_QUBITS;gj=gj+1) begin : gen_inner_wire_0
                assign wire_0[gi][gj] = (basis[gj][1]) ? ((basis[gj][0]) ? 1'b0 : (tableau[gi][gj+`NUM_TOTAL_QUBITS] & tableau[gi][gj])) : 1'b0;
            end
        end
    endgenerate
    assign o_value = (ready) ? value : 0;
    assign o_is_zero = is_zero;
    assign o_is_neg = is_neg;
    assign o_ready = ready;
    generate
        for(gi=0;gi<`NUM_TOTAL_QUBITS;gi=gi+1) begin : gen_obs_row
            assign obs_row[gi] = basis[gi][1];
            assign obs_row[gi+`NUM_TOTAL_QUBITS] = basis[gi][0];
        end
        assign obs_row[2*`NUM_TOTAL_QUBITS] = 0;
    endgenerate

    generate
        for(gi=0;gi<2*`NUM_TOTAL_QUBITS;gi=gi+1) begin : gen_wire_1
            for(gj=0;gj<`NUM_TOTAL_QUBITS;gj=gj+1) begin : gen_inner_wire_0
                assign wire_1[gi][gj] = (obs_row[gj] & tableau[gi][gj+`NUM_TOTAL_QUBITS]) ^ (obs_row[gj+`NUM_TOTAL_QUBITS] & tableau[gi][gj]);
            end
        end
    endgenerate
    generate
        for(gi=0;gi<2*`NUM_TOTAL_QUBITS;gi=gi+1) begin : gen_iscommute
            assign IsCommute[gi] = 1 ^ (^wire_1[gi]);
        end
    endgenerate
//==========================Sequential==========================
    always @(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) begin
            for(i=0;i<2*`NUM_TOTAL_QUBITS;i=i+1) begin
                tableau[i] <= 0;
                tableau_setup[i] <= 0;
            end
            // Reset state
            state <= 0;
            // Reset basis & result
            for(i = 0;i < `NUM_TOTAL_QUBITS;i = i+1) begin
                basis[i] <= 2'b00;
                result[i] <= 2'b00;
            end
            // Reset value and ready
            value <= 0;
            is_zero <= 0;
            is_neg <= 0;
            ready <= 0;
            // Reset counter
            cnt2 <= 0;
            cnt2_j <= 0;
            cnt3 <= 0;
            // Reset
            first_row_idx <= 0;
            ancilla <= {`WIDTH{1'b0}};
            first_row <= {`WIDTH{1'b0}};

        end else begin
            state <= nxt_state;
            if(state == 0) begin
                // Read in
                for(i=0;i<`NUM_TOTAL_QUBITS;i=i+1)begin
                    basis[i] <= i_basis_vec[i];
                    result[i] <= i_result_vec[i];
                end
                value <= 0;
            end
            else begin
                // Step 0
                for(i=0;i<`NUM_TOTAL_QUBITS;i=i+1) begin
                    basis[i] <= nxt_basis[i];
                end
                value <= nxt_value;
            end
            for(i=0;i<2*`NUM_TOTAL_QUBITS;i=i+1) begin
                tableau[i] <= nxt_tableau[i];
                tableau_setup[i] <= nxt_tableau_setup[i];
            end
            is_zero <= nxt_is_zero;
            is_neg <= nxt_is_neg;
            cnt2 <= nxt_cnt2;
            cnt2_j <= nxt_cnt2_j;
            first_row_idx <= nxt_first_row_idx;
            first_row <= nxt_first_row;
            ready <= nxt_ready;
            ancilla <= nxt_ancilla;
            cnt3 <= nxt_cnt3;
            ready <= nxt_ready;
        end
    end
//==========================State control==========================
    always @(*) begin
        if(state==0) begin
            if (i_setup || i_back_setup) begin
                nxt_state = 1;
            end
            else begin
                nxt_state = 0;
            end
            nxt_cnt2 = 0;
            nxt_cnt2_j = 0;
            nxt_cnt3 = 0;
            nxt_ready = 0;
        end
        else if(state == 1) begin
            nxt_state = 2;
            nxt_cnt2 = 0;
            nxt_cnt2_j = 0;
            nxt_cnt3 = 0;
            nxt_ready = ready;
        end
        else if(state == 2) begin
            nxt_cnt3 = 0;
            if(!result[cnt2][1]) begin
                if(cnt2 == `NUM_TOTAL_QUBITS-1) begin
                    nxt_state = 3;
                    nxt_cnt2 = 0;
                    nxt_cnt2_j = 0;
                    nxt_ready = ready;
                end
                else begin
                    nxt_cnt2 = cnt2 + 1;
                    nxt_cnt2_j = 0;
                    nxt_ready = ready;
                    nxt_state = state;
                end
            end
            else begin
                if(cnt2_j >= `NUM_TOTAL_QUBITS) begin
                    if(cnt2_j == `NUM_TOTAL_QUBITS && first_row_idx == 0 && nxt_ancilla[2*`NUM_TOTAL_QUBITS] != result[cnt2][0]) begin
                        nxt_state = 4;
                        nxt_ready = 1;
                        nxt_cnt2 = 0;
                        nxt_cnt2_j = 0;
                    end
                    else if(cnt2 == `NUM_TOTAL_QUBITS-1) begin
                        nxt_state = 3;
                        nxt_cnt2 = 0;
                        nxt_cnt2_j = 0;
                        nxt_ready = ready;
                    end
                    else begin
                        nxt_cnt2_j = 0;
                        nxt_cnt2 = cnt2 + 1;
                        nxt_ready = ready;
                        nxt_state = state;
                    end
                end
                else begin
                    nxt_cnt2_j = cnt2_j + 1;
                    nxt_cnt2 = cnt2;
                    nxt_state = state;
                    nxt_ready = ready;
                end
            end
        end
        else if(state == 3) begin
            nxt_cnt2 = 0;
            nxt_cnt2_j = 0;
            if(&IsCommute[`NUM_TOTAL_QUBITS:2*`NUM_TOTAL_QUBITS-1] == 0) begin
                nxt_state = 4;
                nxt_ready = 1;
                nxt_cnt3 = 0;
            end
            else begin
                if(cnt3 == `NUM_TOTAL_QUBITS) begin
                    nxt_state = 4;
                    nxt_ready = 1;
                    nxt_cnt3 = 0;
                end
                else begin
                    nxt_state = state;
                    nxt_ready = 0;
                    nxt_cnt3 = cnt3 + 1;
                end
            end
        end
        else begin
            nxt_state = 0;
            nxt_cnt2 = 0;
            nxt_cnt2_j = 0;
            nxt_cnt3 = 0;
            nxt_ready = 0;
        end
    end
//==========================Observables==========================
    always @(*) begin
        for(i = 0;i<`NUM_TOTAL_QUBITS;i=i+1) begin
            nxt_basis[i] = basis[i];
        end
        if(state == 1) begin
            for(i = 0;i<`NUM_TOTAL_QUBITS;i=i+1) begin
                if(basis[i] >= 2'b10) begin
                    nxt_basis[i] = 2'b01;
                end
                else nxt_basis[i] = basis[i];
            end
        end
        else if(state == 2) begin
            if(cnt2_j == 0 && result[cnt2][1]) nxt_basis[cnt2] = 2'b00;
            else nxt_basis[cnt2] = basis[cnt2];
        end
        else begin
            for(i = 0;i<`NUM_TOTAL_QUBITS;i=i+1) begin
                nxt_basis[i] = basis[i];
            end
        end
    end
//==========================Tableau==========================
    always @(*) begin
        for(i=0;i<2*`NUM_TOTAL_QUBITS;i=i+1) begin
            nxt_tableau[i] = tableau[i];
            nxt_tableau_setup[i] = tableau_setup[i];
        end
        if (state == 0) begin
            nxt_ancilla = 0;
            if (i_back_setup) begin
                for(i=0;i<2*`NUM_TOTAL_QUBITS;i=i+1) begin
                    nxt_tableau[i] = tableau_setup[i];
                end
            end
            else begin
                // Reset tableau
//@3
nxt_tableau[0] = `WIDTH'b1000100011101010000111110110000010000110001011110010011100100011000010100;
nxt_tableau[1] = `WIDTH'b0111000001000010110110101111010010101110000110000000000110011101000010101;
nxt_tableau[2] = `WIDTH'b1100010011010111011011111100001010000111110111110010000100010100110010100;
nxt_tableau[3] = `WIDTH'b1110011100010100010101101001111010101110111111000110110111000001010000100;
nxt_tableau[4] = `WIDTH'b1011010101010110101111011110001010101101100100011111110011011111110000101;
nxt_tableau[5] = `WIDTH'b0110110111100000110001100011111000001100010101100011011110110110001010100;
nxt_tableau[6] = `WIDTH'b1100111000101100001110100111001010101010000110111111001111000111110000001;
nxt_tableau[7] = `WIDTH'b1110011000011110001001110111010000100100111111001010101100011001000010100;
nxt_tableau[8] = `WIDTH'b1000111110111000110011001000100000100010110010001111101011111000011000100;
nxt_tableau[9] = `WIDTH'b1011000011010100100100101000011010100011011101101001110100101001000010100;
nxt_tableau[10] = `WIDTH'b0010101100111100101001000000001000101000001100000100000011111110001010100;
nxt_tableau[11] = `WIDTH'b0011011011011010001100010001101000001000100010110010110111100001100000001;
nxt_tableau[12] = `WIDTH'b1000001101000001111011010011011000001010111100100001011110001100110000000;
nxt_tableau[13] = `WIDTH'b1000011001110001011110101101000000000000111001110000101111111101010000100;
nxt_tableau[14] = `WIDTH'b1111010011101011001001111100100000101110110100011010001010100101111000000;
nxt_tableau[15] = `WIDTH'b0101101111110101001010010001100000101101010000001011110100011111010000000;
nxt_tableau[16] = `WIDTH'b1010010110100111101010010000101000000110110001100010000101000111001010100;
nxt_tableau[17] = `WIDTH'b1110100011100010111111001110100010001111100011011000010001100001111000100;
nxt_tableau[18] = `WIDTH'b0100101100100001010000111011101010000000001011101101010001011001101000000;
nxt_tableau[19] = `WIDTH'b0101100111100111001010001101011010001111010101101000000010011110101000000;
nxt_tableau[20] = `WIDTH'b1100111000001010100001100110000000101010001100100101100011110010100010001;
nxt_tableau[21] = `WIDTH'b1110110001110000001101101101101010001100010000011110010001010111100010100;
nxt_tableau[22] = `WIDTH'b1011011100001010001011010010010010001001011110100101110011100011100010000;
nxt_tableau[23] = `WIDTH'b1011001100100010011101101011000010100110001010101110101101111001001000001;
nxt_tableau[24] = `WIDTH'b1101100000010001001001111010100000100110101111101110100101111111011000101;
nxt_tableau[25] = `WIDTH'b0100100010001110101001111111110010001001101101000111100000000000000000101;
nxt_tableau[26] = `WIDTH'b1100111010101110000111001010000000001010110011001000001111011011011010100;
nxt_tableau[27] = `WIDTH'b0111010010100000100101011111101000101000111110100010101111101001101010100;
nxt_tableau[28] = `WIDTH'b0100111010110001101100101010011000000000010011101111111100101111011000101;
nxt_tableau[29] = `WIDTH'b0010000001111000001100101001010000001001110110100011101001011100110000001;
nxt_tableau[30] = `WIDTH'b1001111000110000111110000100000000001011011100010001100110001000000010101;
nxt_tableau[31] = `WIDTH'b0000000000000000000000000000000100000000000000000000000000000000000000000;
nxt_tableau[32] = `WIDTH'b0000011100111111011011000001011000001100100100100100101100010001001000100;
nxt_tableau[33] = `WIDTH'b0000000000000000000000000000000001000000000000000000000000000000000000000;
nxt_tableau[34] = `WIDTH'b1100011100000000010111001001111000101111101101110000101000001000011000100;
nxt_tableau[35] = `WIDTH'b0000000000000000000000000000000000010000000000000000000000000000000000000;
nxt_tableau[36] = `WIDTH'b1111100110100011100001111010000000101001110100101001000001011100111000000;
nxt_tableau[37] = `WIDTH'b1000001001101110101100000100011010101010110111001101100000100010010010101;
nxt_tableau[38] = `WIDTH'b1011100101000000101010001110101000101011101001011110000110000101111010100;
nxt_tableau[39] = `WIDTH'b1011001100000001111010011111000010100010000101110010111100110111011000100;
nxt_tableau[40] = `WIDTH'b0000010011110101010111101000100010001011100001100000000011110010011010100;
nxt_tableau[41] = `WIDTH'b0100101100001011001100000111110010000011010001101111101000010010110000100;
nxt_tableau[42] = `WIDTH'b0011010001111010101101011001111000100111101000011001000100111110011000100;
nxt_tableau[43] = `WIDTH'b1100001100001110001100011011001000101100111001001010111101001001000010101;
nxt_tableau[44] = `WIDTH'b1100101000101100100000011100101010001101110010000101010100100100100000001;
nxt_tableau[45] = `WIDTH'b0001100101011011110011001000001000001111001111101110010011110111000000000;
nxt_tableau[46] = `WIDTH'b1101001010010111001000011001001010100100000001100101011111101101011000000;
nxt_tableau[47] = `WIDTH'b0100111110101000001011000110010010101001111000110000010010011101010000001;
nxt_tableau[48] = `WIDTH'b0100111010011110101110001110011010000101101101111110010010110101110000100;
nxt_tableau[49] = `WIDTH'b0011011110010111100000000000100000101101101101111110011111000110001010000;
nxt_tableau[50] = `WIDTH'b0110100101001001100101100101001000101101101101111010010001010110100010100;
nxt_tableau[51] = `WIDTH'b0100100010101001101011111100011000100001001101101101010011001001000010000;
nxt_tableau[52] = `WIDTH'b0011000100001011000011101011011000100110011001110011100011001100100000000;
nxt_tableau[53] = `WIDTH'b1001111110010111100100110001011010100100111111111101110011011101011000101;
nxt_tableau[54] = `WIDTH'b0111011111100010010000000101010000100111011011101111110111111010110010100;
nxt_tableau[55] = `WIDTH'b1000000010000100110011000101000000001111110101110111101011011010011000100;
nxt_tableau[56] = `WIDTH'b1000100111010010110100011001001000100011111011101010110100110101111000101;
nxt_tableau[57] = `WIDTH'b0110100000011100010011010000101010100010111000101110001100101100110010000;
nxt_tableau[58] = `WIDTH'b1011110010101111110100110001110000001010000110110111001111001110001010001;
nxt_tableau[59] = `WIDTH'b0100011111000000110111101110101000101100111010101001111011000100110010101;
nxt_tableau[60] = `WIDTH'b1011110011011000011110110001001010000010001110101010001011010010010000101;
nxt_tableau[61] = `WIDTH'b1001110110010111001111000000110010000110111011000010011100100110110000000;
nxt_tableau[62] = `WIDTH'b0001110010110011011101100110010010101111111100010011110111101110000000100;
nxt_tableau[63] = `WIDTH'b1111111111001001100111000111001010000110110000111111110000111100000000001;
nxt_tableau[64] = `WIDTH'b1110110011100011100010100100110010101001010100111110001001011000101010001;
nxt_tableau[65] = `WIDTH'b0011010110001111110011100001111000000001010111101101011001001000100010001;
nxt_tableau[66] = `WIDTH'b0000101001101001010000011000011100101101100101101110000110001101100000001;
nxt_tableau[67] = `WIDTH'b1001111000110000111110000100000000001011011100010001100110001000000110100;
nxt_tableau[68] = `WIDTH'b0100110100000110110110000101011001101101010101101100101000010000011010100;
nxt_tableau[69] = `WIDTH'b0000011100111111011011000001011000001100100100100100101100010001001001101;
nxt_tableau[70] = `WIDTH'b1110000100010001100010000000111000111110010100000111101100000101001000100;
nxt_tableau[71] = `WIDTH'b1100011100000000010111001001111000101111101101110000101000001000011000111;
            end
        end
        else if(state == 1) begin
            nxt_ancilla = 0;
            for(i=0;i<2*`NUM_TOTAL_QUBITS;i=i+1) begin
                for(j=0;j<`NUM_TOTAL_QUBITS;j=j+1) begin
                    nxt_tableau[i][j] = (basis[j][1]) ? ((basis[j][0]) ? (tableau[i][j+`NUM_TOTAL_QUBITS] ^ tableau[i][j]) : tableau[i][j+`NUM_TOTAL_QUBITS]) : tableau[i][j];
                    nxt_tableau[i][j+`NUM_TOTAL_QUBITS] = (basis[j][1]) ? tableau[i][j] : tableau[i][j+`NUM_TOTAL_QUBITS];
                end
                nxt_tableau[i][2*`NUM_TOTAL_QUBITS] = tableau[i][2*`NUM_TOTAL_QUBITS] ^ (^wire_0[i]);
            end
        end
        else if(state == 2) begin
            if(cnt2_j != 0 && first_row_idx != 0) begin
                nxt_ancilla = 0;
                if(cnt2_j-1 == first_row_idx-`NUM_TOTAL_QUBITS) begin
                    nxt_tableau[cnt2_j-1] = new_row_1;
                    nxt_tableau[cnt2_j-1+`NUM_TOTAL_QUBITS] = {`WIDTH{1'b0}};
                    nxt_tableau[cnt2_j-1+`NUM_TOTAL_QUBITS][cnt2+`NUM_TOTAL_QUBITS] = 1'b1;
                    nxt_tableau[cnt2_j-1+`NUM_TOTAL_QUBITS][2*`NUM_TOTAL_QUBITS] = result[cnt2][0];
                end
                else begin
                    if(tableau[cnt2_j-1][cnt2]) nxt_tableau[cnt2_j-1] = new_row_1;
                    else nxt_tableau[cnt2_j-1] = tableau[cnt2_j-1];
                    if(tableau[cnt2_j-1+`NUM_TOTAL_QUBITS][cnt2]) nxt_tableau[cnt2_j-1+`NUM_TOTAL_QUBITS] = new_row_2;
                    else nxt_tableau[cnt2_j-1+`NUM_TOTAL_QUBITS] = tableau[cnt2_j-1+`NUM_TOTAL_QUBITS];
                end
            end
            else if(cnt2_j != 0 && first_row_idx == 0) begin
                if(tableau[cnt2_j-1][cnt2]) begin
                    nxt_ancilla = new_row_1;
                end
                else begin
                    nxt_ancilla = ancilla;
                end
            end
            else begin
                for(i=0;i<2*`NUM_TOTAL_QUBITS;i=i+1) begin
                    nxt_tableau[i] = tableau[i];
                end
                nxt_ancilla = {`WIDTH{1'b0}};
            end
        end
        else if(state == 3) begin
            if(cnt3 == 0) begin
                nxt_ancilla = {`WIDTH{1'b0}};
            end
            else begin
                if(IsCommute[cnt3-1] == 0) nxt_ancilla = new_row_1;
                else nxt_ancilla = ancilla;
            end
        end
        else if(state == 4) begin
            if (i_setup) begin
                for(i=0;i<2*`NUM_TOTAL_QUBITS;i=i+1) nxt_tableau_setup[i] = tableau[i];
            end
            nxt_ancilla = ancilla;
        end
        else nxt_ancilla = ancilla;
    end
//==========================Priority Encoder==========================
    always @(*) begin
        nxt_first_row_idx = first_row_idx;
        nxt_first_row = first_row;
        nxt_is_zero = is_zero;
        nxt_is_neg = is_neg;
        if (state == 0) begin
            nxt_is_zero = 0;
            nxt_is_neg = 0;
            nxt_value = 0;
        end
        if(state == 2 && cnt2_j == 0 && result[cnt2][1]) begin
            nxt_first_row_idx = 0;
            nxt_value = value;
            for(i=2*`NUM_TOTAL_QUBITS-1;i>=`NUM_TOTAL_QUBITS;i=i-1) begin
                if(tableau[i][cnt2]) begin
                    nxt_first_row_idx = i;
                    nxt_value = value + 1;
                end
            end
            nxt_first_row = tableau[nxt_first_row_idx];
        end
        else if(state == 2 && cnt2_j == `NUM_TOTAL_QUBITS && first_row_idx == 0 && nxt_ancilla[2*`NUM_TOTAL_QUBITS] != result[cnt2][0]) begin
            nxt_value = 0;
            nxt_is_zero = 1;
        end
        else if(state == 3 && &IsCommute[`NUM_TOTAL_QUBITS:2*`NUM_TOTAL_QUBITS-1] == 0) begin
            nxt_value = 0;
            nxt_is_zero = 1;
        end
        else if(state == 3 && cnt3 == `NUM_TOTAL_QUBITS) begin
            if(nxt_ancilla[2*`NUM_TOTAL_QUBITS]) begin
                nxt_value = value;
                nxt_is_neg = 1;
            end
            else nxt_value = value;
        end
        else nxt_value = value;
    end
//==========================Rowsum Wire assignment==========================
    always @(*) begin
        row1_2 = {`WIDTH{1'b0}};
        row2_2 = {`WIDTH{1'b0}};
        if(state == 2) begin
            if(first_row_idx != 0 && cnt2_j != 0) begin
                if(cnt2_j-1 == first_row_idx-`NUM_TOTAL_QUBITS) begin
                    row1_1 = {`WIDTH{1'b0}};
                    row2_1 = first_row;
                    row1_2 = {`WIDTH{1'b0}};
                    row2_2 = {`WIDTH{1'b0}};
                end
                else begin
                    row1_1 = first_row;
                    row2_1 = tableau[cnt2_j-1];
                    row1_2 = first_row;
                    row2_2 = tableau[cnt2_j-1+`NUM_TOTAL_QUBITS];
                end
            end
            else if(first_row_idx == 0 && cnt2_j != 0) begin
                row1_1 = tableau[cnt2_j-1+`NUM_TOTAL_QUBITS];
                row2_1 = ancilla;
            end
            else begin
                row1_1 = {`WIDTH{1'b0}};
                row2_1 = {`WIDTH{1'b0}};
            end
        end
        else if(state == 3) begin
            if(cnt3 != 0) begin
                row1_1 = tableau[cnt3-1+`NUM_TOTAL_QUBITS];
                row2_1 = ancilla;
            end
            else begin
                row1_1 = {`WIDTH{1'b0}};
                row2_1 = {`WIDTH{1'b0}};
            end
        end
        else begin
            row1_1 = {`WIDTH{1'b0}};
            row2_1 = {`WIDTH{1'b0}};
        end
    end


endmodule

module row_sum(
    input wire [0 : 2*`NUM_TOTAL_QUBITS] row1,
    input wire [0 : 2*`NUM_TOTAL_QUBITS] row2,
    output reg [0 : 2*`NUM_TOTAL_QUBITS] new_row
);
    wire [1 : 0] phase_i [0 : `NUM_TOTAL_QUBITS-1];
    wire [0 : 2*`NUM_TOTAL_QUBITS-1] front_row;
    reg [1 : 0] sum;
    reg last_bit;
    integer i;
    generate
        genvar gi;
        for(gi=0;gi<`NUM_TOTAL_QUBITS;gi=gi+1) begin : phase_assign
            assign phase_i[gi] = (row1[gi] & ~row1[gi+`NUM_TOTAL_QUBITS] & row2[gi] & row2[gi+`NUM_TOTAL_QUBITS]) ? 2'b01 :
                                    (row1[gi] & row1[gi+`NUM_TOTAL_QUBITS] & ~row2[gi] & row2[gi+`NUM_TOTAL_QUBITS]) ? 2'b01 :
                                    (~row1[gi] & row1[gi+`NUM_TOTAL_QUBITS] & row2[gi] & ~row2[gi+`NUM_TOTAL_QUBITS]) ? 2'b01 :
                                    (row1[gi] & ~row1[gi+`NUM_TOTAL_QUBITS] & ~row2[gi] & row2[gi+`NUM_TOTAL_QUBITS]) ? 2'b11 :
                                    (~row1[gi] & row1[gi+`NUM_TOTAL_QUBITS] & row2[gi] & row2[gi+`NUM_TOTAL_QUBITS]) ? 2'b11 :
                                    (row1[gi] & row1[gi+`NUM_TOTAL_QUBITS] & row2[gi] & ~row2[gi+`NUM_TOTAL_QUBITS]) ? 2'b11 :
                                    2'b00;
        end
    endgenerate
    assign front_row = row1[0:2*`NUM_TOTAL_QUBITS-1] ^ row2[0:2*`NUM_TOTAL_QUBITS-1];

    always @(*) begin
        sum = 0;
        for(i=0;i<`NUM_TOTAL_QUBITS;i=i+1) begin
            sum = (sum + phase_i[i]) % 4;
        end
        last_bit = row1[2*`NUM_TOTAL_QUBITS] ^ row2[2*`NUM_TOTAL_QUBITS] ^ sum[1];
        new_row = {front_row, last_bit};
    end
endmodule
