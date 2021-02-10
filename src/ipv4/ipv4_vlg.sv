import ipv4_vlg_pkg::*;
import mac_vlg_pkg::*;
import eth_vlg_pkg::*;
import tcp_vlg_pkg::*;

module ipv4_vlg #(
  parameter bit VERBOSE = 1
)
(
  input logic  clk,
  input logic  rst,
  mac.in_rx    mac_rx,
  mac.out_tx   mac_tx,
  input  dev_t dev,
  arp_tbl.out  arp_tbl,
  ipv4.in_tx   tx,
  ipv4.out_rx  rx
);

  ipv4_vlg_rx #(
    .VERBOSE (VERBOSE)
  )
  ipv4_vlg_rx_inst (
    .clk  (clk),
    .rst  (rst),
    .mac  (mac_rx),
    .ipv4 (rx),
    .dev  (dev)
  );
  
  ipv4_vlg_tx #(
    .VERBOSE (VERBOSE)
  ) ipv4_vlg_tx_inst (
    .clk      (clk),
    .rst      (rst),
    .mac      (mac_tx),
    .ipv4     (tx),
    .dev      (dev),
    .arp_tbl  (arp_tbl)
  );

endmodule : ipv4_vlg