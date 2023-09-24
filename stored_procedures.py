import mysql.connector

connection = mysql.connector.connect(host='127.0.0.1',database='royale_baby_clinic',user='root',password='Willywonka@12')
if connection.is_connected():
    db_Info = connection.get_server_info()
    print("My db server",db_Info)
    cursor = connection.cursor()
    cursor.execute("Select database();")
    record = cursor.fetchone()
    print("connected to database:",record)
print("Select : \n1. employeeInfo \n2. patientinfo \n3. pharmacyInfo ")
choice = int(input())
if choice == 1:
    cursor.callproc('employeeInfo')
elif choice == 2:
    print("Enter patient id:")
    pid = int(input())
    cursor.callproc('specificPatient',[pid])
else:
    cursor.callproc('pharmacyInfo')



for result in cursor.stored_results():

    list = result.fetchall()
    for row in list:
        col = row
        for c in col:
            print(c)
        print('------------------')
    print(result.fetchall())


