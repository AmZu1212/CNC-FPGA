# 2025-12-25T21:24:14.563810100
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis-Platforms")

platform = client.get_component(name="SDPlatform")
status = platform.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../SD_Demo/SD_System_wrapper.xsa")

status = platform.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../SD_Demo/SD_System_wrapper.xsa")

status = platform.build()

status = platform.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = comp.clean()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../SD_Demo/SD_System_wrapper.xsa")

status = platform.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

