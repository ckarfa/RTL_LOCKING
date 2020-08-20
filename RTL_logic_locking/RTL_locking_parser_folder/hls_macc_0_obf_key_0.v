
module hls_macc_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  in1,
  in2,
  in3,
  in4,
  in7,
  in8,
  in9,
  in10,
  in14,
  in12,
  in15,
  in17,
  in19,
  in20,
  in22,
  in24,
  in27,
  in28,
  in29,
  in32,
  out13,
  out13_ap_vld,
  out30_i,
  out30_o,
  out30_o_ap_vld,
  out31,
  out31_ap_vld
);


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if(working[0] == 1'b1) begin
	ap_NS_fsm = ap_ST_fsm_state3; 
        end else begin ap_NS_fsm = ap_ST_fsm_state3;
      end
      end
      ap_ST_fsm_state3: begin
        if(working[0] == 1'b1) ap_NS_fsm = ap_ST_fsm_state4; 
        else ap_NS_fsm = ap_ST_fsm_state4;
      end
      ap_ST_fsm_state4: begin
        if(working[0] == 1'b1) ap_NS_fsm = ap_ST_fsm_state1; 
        else ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        if(working[0] == 1'b1) ap_NS_fsm = 'bx; 
        else ap_NS_fsm = 'bx;
      end
    endcase
  end


endmodule

