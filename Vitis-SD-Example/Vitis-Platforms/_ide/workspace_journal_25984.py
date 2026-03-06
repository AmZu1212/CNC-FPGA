# 2025-12-24T12:49:46.609035100
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis-Platforms")

platform = client.get_component(name="SDPlatform")
domain = platform.get_domain(name="standalone_ps7_cortexa9_0")

status = domain.set_lib(lib_name="xilffs", path="X:\Xilinx\Vitis\2024.2\data\embeddedsw\lib\sw_services\xilffs_v5_3")

status = platform.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

vitis.dispose()

