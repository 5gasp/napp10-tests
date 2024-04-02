#!/bin/bash
# @Author: Rafael Direito
# @Date:   2024-03-21 19:29:08
# @Last Modified by:   Rafael Direito
# @Last Modified time: 2024-03-26 15:13:45

python3 -m venv venv && source venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt 

# vOBU
echo "Transport API Test..."
export neo_transport_api_test_host=10.10.10.110
export neo_transport_api_test_port=31391
python -m robot .
