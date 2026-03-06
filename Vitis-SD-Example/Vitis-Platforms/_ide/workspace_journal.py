# 2026-03-05T22:21:52.559988
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis-Platforms")

platform = client.get_component(name="SDPlatform")
domain = platform.get_domain(name="standalone_ps7_cortexa9_0")

status = domain.regenerate()

vitis.dispose()

