import logger
import azure_database

logger.set_file("/log.txt")

class Server:
  def __init__(self):
    self.port = 80
    self.host = "127.0.0.1"
    self.connection_to_user = {}
    self.data_parts_to_user = {}

  def start(self):
    self.__listen(self.port, self.host)
    logger.debug(f"Started to listen on {self.host}:{self.port}")

  def save_data(self, user, data):
    con = self.connection_to_user.get(user, None)
    if con is None:
      con = azure_database.connect(host="127.0.0.1:5009",password="8dahR#&HDj")
      self.connection_to_user[user] = con
    con.save(data)
    self.data_parts_to_user[user] = data
    logger.info(f"Data was properly saved")

  def append_data(self, user, data):
    existing_data = self.data_parts_to_user.get(user, None)
    if existing_data is None:
      raise("First add some data!")
    self.data_parts_to_user[user] + =data

  def __listen(self):
    # Listening logic...
    pass