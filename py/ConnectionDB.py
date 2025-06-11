import cx_Oracle, sys

class ConnectionDB:

    def connect(self, username='', password='', connStr=''):
        """
		:param:   connstr is host:port/sid [ex. 10.224.102.10:2992/pdev]
             :return:  connect DB
        """
        try:
            self.db = cx_Oracle.connect(username, password, connStr)
        except cx_Oracle._Error as ex:
            raise ex.message

        return self.db

    def query(self, db, sql, num_rows=1):
        """
        :param db: database object
        :param sql: sql query (select) string
        :param num_rows: number of result (row) that you want
        :return:
        """
        if db is None:
            sys.stderr.write("Database Object is None, please call \"Connect\" before call this keyword")
            return []
        cursor = db.cursor()
        cursor.execute(sql)
        columns = [i[0] for i in cursor.description]
        rows = cursor.fetchall()
        result = []
        index = 1
        if not rows:
            return []
        else:
            for row in rows:
                if index > int(num_rows):
                    break
                result.append(dict(zip(columns, row)))
                index += 1
        return result

    def query_all(self, db, sql):
        """
        - param db: Oracle database object, initialize using 'connect' keyword
        - sql: sql string
        - return: list of query result
        """
        # if db is None:
        #     sys.stderr.write("Database Object is None, please call \"Connect\" before call this keyword")
        #     return []
        cursor = db.cursor()
        cursor.execute(sql)
        columns = [i[0] for i in cursor.description]
        rows = cursor.fetchall()
        result = []
        index = 1
        if not rows:
            return []
        else:
            for row in rows:
                result.append(dict(zip(columns, row)))
                index += 1
        return result

    """Get value from result_list by specifying column_name and key
    e.g. [{'REID': 249343, 'RE_KEY': 'base_fee', 'VALUE': '10'}, {'REID': 249343, 'RE_KEY': 'method', 'VALUE': '1'}]
    specify column_name='RE_KEY' and key='base_fee', this method return the first dict object
    {'REID': 249343, 'RE_KEY': 'base_fee', 'VALUE': '10'}
    """
    def get_row_from_list(self, result_list, column_name, key):
        for dict in result_list:
            if dict[column_name] == key:
                return dict

				
	# def insert_data(self, db, sql):
	# 	cursor = db.cursor()
    #     cursor.execute(sql)
    #     db.commit()


    def update(self, db, sql):
        """
        :param db: database object
        :param sql: update sql string
        :return: None
        """
        cursor = db.cursor()
        cursor.execute(sql)
        db.commit()

    def execute_sql(self, db, sql):
        cursor = db.cursor()
        cursor.execute(sql)
        db.commit()

    def disconnect(self):
        self.db.cursor().close()
        self.db.close()