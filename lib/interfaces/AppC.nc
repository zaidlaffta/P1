configuration AppC {  
    provides interface Boot;  
}  
  
implementation {  
    components MainC, ActiveMessageC, Flood, NeighborDiscovery;  
  
    MainC.Boot -> AppC.Boot;  
    AppC.Packet -> ActiveMessageC;  
  
    // Wiring for the Flood protocol  
    AppC.StdControl -> Flood;  
    AppC.Packet -> Flood.Packet;  
    AppC.AMSend -> Flood.AMSend;  
    AppC.Receive -> Flood.Receive;  
    AppC.FloodTimer -> Flood.FloodTimer;  
  
    // Wiring for the Neighbor Discovery protocol  
    AppC.StdControl -> NeighborDiscovery;  
    AppC.Packet -> NeighborDiscovery.Packet;  
    AppC.AMSend -> NeighborDiscovery.AMSend;  
    AppC.Receive -> NeighborDiscovery.Receive;  
    AppC.NeighborTimer -> NeighborDiscovery.NeighborTimer;  
}  