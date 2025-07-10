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
