#!/bin/bash
# @Author: Rafael Direito
# @Date:   2024-03-21 19:29:08
# @Last Modified by:   Rafael Direito
# @Last Modified time: 2024-03-26 15:12:00

python3 -m venv venv && source venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt 

# vOBU
echo "Main API Test..."
export main_api_test_host=10.10.10.110
export main_api_test_port=31390
python -m robot .
