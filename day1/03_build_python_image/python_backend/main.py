"""
   Application entry
"""
from api.info import APP
import os
level = os.environ.get("LOG_LEVEL","INFO")

if __name__ == '__main__':
    APP.run(debug=level == "DEBUG", host='0.0.0.0', port='5002')
