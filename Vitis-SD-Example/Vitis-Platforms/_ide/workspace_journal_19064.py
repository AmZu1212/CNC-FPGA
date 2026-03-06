# 2025-12-25T23:04:13.325140400
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis-Platforms")

platform = client.get_component(name="SDPlatform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

