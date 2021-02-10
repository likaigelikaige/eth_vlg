import ipv4_vlg_pkg::*;
import mac_vlg_pkg::*;
import udp_vlg_pkg::*;
import eth_vlg_pkg::*;

module udp_vlg #(
  parameter bit VERBOSE = 1
)
(
  input logic clk,
  input logic rst,
  ipv4.in_rx  rx,
  ipv4.out_tx tx,
  udp.in_tx   udp_tx,
  udp.out_rx  udp_rx,
  input dev_t dev
);
  
  udp_hdr_t hdr;
  
  udp_vlg_rx #(
    .VERBOSE (VERBOSE)
  ) udp_vlg_rx_inst (
    .clk  (clk),
    .rst  (rst),
    .dev  (dev),
    .ipv4 (rx),
    .udp  (udp_rx)
  );
  
  udp_vlg_tx #(
    .VERBOSE (VERBOSE)
  ) udp_vlg_tx_inst (
    .clk  (clk),
    .rst  (rst),
    .dev  (dev),
    .ipv4 (tx),
    .udp  (udp_tx)
  );

endmodule : udp_vlg