#!/bin/bash

echo "Switching user to 'postgres'"
echo "After switch run: 'psql -h localhost -p 5432'"
sudo -i -u postgres
