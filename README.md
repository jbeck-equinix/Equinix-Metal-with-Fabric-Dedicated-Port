# nvidia


Basic Terraform module for creating an end-to-end connections from device nodes on Equinix Metal to Equinix colocation environments.

This module will:
1. Create a Metal VLAN
2. Deploy a Metal instance in Hybrid Bonded mode
3. Attach the instance to the VLAN
4. Run script in User Data to configure the Metal network interface(s)

Network Connectivity is facilitated by Equinix Fabric
- A-Side Equinix Fabric Port = Equinix Metal Dedicated Fabric Port
- Z-Side Equinix Fabric Port = Equinix colo/Equinix-customer colo Fabric Port with a Service Profile

![image](https://user-images.githubusercontent.com/67401553/131754678-e8f30a56-af7c-42c5-aafa-30e81d05db06.png)

Note: For Equinxi Metal API Key, a Personal API Key will need to be used to create the Metal Virtual Connection. 

Product Documentation:
- Equinix Fabric: https://docs.equinix.com/en-us/Content/Interconnection/Fabric/Fabric-landing-main.htm
- Equinix Metal:  https://metal.equinix.com/developers/docs/
