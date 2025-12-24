# 2025-12-23T23:23:51.206730500
import vitis

client = vitis.create_client()
client.set_workspace(path="CNC-FPGA")

vitis.dispose()

