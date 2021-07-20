## LuaDataFlowBlocks
Serving Lua functions and events as data flow blocks.

### Description
This sample shows how functions and events from scripts can be served as data flow
blocks. These then can be wired conveniently using the flow editor. In this sample
two functions and one event are declared and served in the script and in the AppManifest.
Adding 'Include data-flow' statement to the served function/event in the AppManifest
makes them available as data flow blocks.
An event with at least one parameter becomes a provider block.
A function with at least one parameter and at least one return value becomes a processor block.
A function with at least one parameter and no return value becomes a consumer block.

### How to Run
To demo this sample, it must be loaded to any device or the emulator. The output
of the consumer function can be seen at the console.

### Implementation
In order to make the created flow blocks appear in BlocksBrowser and to be opened in
FlowEditor it is required that the App, which is serving the blocks, is deployed to
the device

### Topics
Programming-Pattern, Flow, Sample, SICK-AppSpace