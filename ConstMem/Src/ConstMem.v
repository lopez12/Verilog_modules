`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:41 02/15/2012 
// Design Name: 
// Module Name:    ConstMem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ConstMem
(
    input           iClk,
    input           iRst,
    input   [5:0]   ivAddress,
    output  [7:0]   ovData
);
//                      
localparam LINE00   =   "Arturo Sacramento";
localparam LINE01   =   " Lopez Gonzalez  ";
localparam LINE02   =   "  PEV PEVH VHG  ";
localparam LINE03   =   "    -  UAG  -   ";

reg [7:0]   rvData_d;
reg [7:0]   rvData_q;

assign  ovData  =   rvData_q;

always @(posedge iClk or posedge iRst)
begin
    if(iRst)
    begin
        rvData_q    <=  8'b0;
    end
    else
    begin
        rvData_q    <=  rvData_d;
    end
end

always @*
begin
    case(ivAddress[5:4])
        2'b00:
        begin
            case(ivAddress[3:0])
                4'd15:      rvData_d    =   LINE00[7:0];
                4'd14:      rvData_d    =   LINE00[15:8];
                4'd13:      rvData_d    =   LINE00[23:16];
                4'd12:      rvData_d    =   LINE00[31:24];
                4'd11:      rvData_d    =   LINE00[39:32];
                4'd10:      rvData_d    =   LINE00[47:40];
                4'd9:       rvData_d    =   LINE00[55:48];
                4'd8:       rvData_d    =   LINE00[63:56];
                4'd7:       rvData_d    =   LINE00[71:64];
                4'd6:       rvData_d    =   LINE00[79:72];
                4'd5:       rvData_d    =   LINE00[87:80];
                4'd4:       rvData_d    =   LINE00[95:88];        
                4'd3:       rvData_d    =   LINE00[103:96];
                4'd2:       rvData_d    =   LINE00[111:104];        
                4'd1:       rvData_d    =   LINE00[119:112];        
                default:    rvData_d    =   LINE00[127:120];
            endcase
        end
        2'b01:
        begin
            case(ivAddress[3:0])
                4'd15:      rvData_d    =   LINE01[7:0];
                4'd14:      rvData_d    =   LINE01[15:8];
                4'd13:      rvData_d    =   LINE01[23:16];
                4'd12:      rvData_d    =   LINE01[31:24];
                4'd11:      rvData_d    =   LINE01[39:32];
                4'd10:      rvData_d    =   LINE01[47:40];
                4'd9:       rvData_d    =   LINE01[55:48];
                4'd8:       rvData_d    =   LINE01[63:56];
                4'd7:       rvData_d    =   LINE01[71:64];
                4'd6:       rvData_d    =   LINE01[79:72];
                4'd5:       rvData_d    =   LINE01[87:80];
                4'd4:       rvData_d    =   LINE01[95:88];        
                4'd3:       rvData_d    =   LINE01[103:96];
                4'd2:       rvData_d    =   LINE01[111:104];        
                4'd1:       rvData_d    =   LINE01[119:112];        
                default:    rvData_d    =   LINE01[127:120];
            endcase
        end
        2'b10:
        begin
            case(ivAddress[3:0])
                4'd15:      rvData_d    =   LINE02[7:0];
                4'd14:      rvData_d    =   LINE02[15:8];
                4'd13:      rvData_d    =   LINE02[23:16];
                4'd12:      rvData_d    =   LINE02[31:24];
                4'd11:      rvData_d    =   LINE02[39:32];
                4'd10:      rvData_d    =   LINE02[47:40];
                4'd9:       rvData_d    =   LINE02[55:48];
                4'd8:       rvData_d    =   LINE02[63:56];
                4'd7:       rvData_d    =   LINE02[71:64];
                4'd6:       rvData_d    =   LINE02[79:72];
                4'd5:       rvData_d    =   LINE02[87:80];
                4'd4:       rvData_d    =   LINE02[95:88];        
                4'd3:       rvData_d    =   LINE02[103:96];
                4'd2:       rvData_d    =   LINE02[111:104];        
                4'd1:       rvData_d    =   LINE02[119:112];        
                default:    rvData_d    =   LINE02[127:120];
            endcase
        end
        default:
        begin
            case(ivAddress[3:0])
                4'd15:      rvData_d    =   LINE03[7:0];
                4'd14:      rvData_d    =   LINE03[15:8];
                4'd13:      rvData_d    =   LINE03[23:16];
                4'd12:      rvData_d    =   LINE03[31:24];
                4'd11:      rvData_d    =   LINE03[39:32];
                4'd10:      rvData_d    =   LINE03[47:40];
                4'd9:       rvData_d    =   LINE03[55:48];
                4'd8:       rvData_d    =   LINE03[63:56];
                4'd7:       rvData_d    =   LINE03[71:64];
                4'd6:       rvData_d    =   LINE03[79:72];
                4'd5:       rvData_d    =   LINE03[87:80];
                4'd4:       rvData_d    =   LINE03[95:88];        
                4'd3:       rvData_d    =   LINE03[103:96];
                4'd2:       rvData_d    =   LINE03[111:104];        
                4'd1:       rvData_d    =   LINE03[119:112];        
                default:    rvData_d    =   LINE03[127:120];
            endcase
        end
        
    endcase
    
end

endmodule
