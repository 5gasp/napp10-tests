#!/bin/bash
# @Author: Rafael Direito
# @Date:   2024-03-21 19:29:08
# @Last Modified by:   Rafael Direito
# @Last Modified time: 2024-03-26 15:17:33

python3 -m venv venv && source venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt 

echo "Routing Engine Test..."
export neo_routing_engine_test_host=10.10.10.110
export neo_routing_engine_test_port=31393
export neo_routing_engine_test_option=ROUTING-ENGINE-ESTIMATION
export neo_routing_engine_test_output=pending
python -m robot .