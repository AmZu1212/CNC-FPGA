# 2025-12-23T23:27:41.282043700
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis-Platforms")

platform = client.create_platform_component(name = "SDPlatform",hw_design = "$COMPONENT_LOCATION/../../SD_Demo/SD_System_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0")

comp = client.create_app_component(name="hello_world",platform = "$COMPONENT_LOCATION/../SDPlatform/export/SDPlatform/SDPlatform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

client.delete_component(name="hello_world")

comp = client.create_app_component(name="hello_world",platform = "$COMPONENT_LOCATION/../SDPlatform/export/SDPlatform/SDPlatform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

client.delete_component(name="hello_world")

platform = client.get_component(name="SDPlatform")
status = platform.build()

comp = client.create_app_component(name="hello_world",platform = "$COMPONENT_LOCATION/../SDPlatform/export/SDPlatform/SDPlatform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

