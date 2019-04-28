# _*_ coding:UTF-8 _*_
# 开发人员: 理想国真恵玩-张大鹏
# 开发团队: 理想国真恵玩
# 开发时间: 2019-04-28 09:32
# 文件名称: hw_002_pymysql的使用.py
# 开发工具: PyCharm
import pymysql

conn = pymysql.connect(host="cdb-5ssi1fam.bj.tencentcdb.com", user='lxgzhw', password='lxgzhw123456',
                       database="mysql_tutorial", port=10068, charset='utf8')
cursor = conn.cursor()

username = input("用户名:")
password = input("密码:")

sql = "select username,password from userinfo where username='{}' and password='{}'".format(username, password)
cursor.execute(sql)
result = cursor.fetchone()

cursor.close()
conn.close()
if result:
    print('登录成功')
else:
    print('登录失败')
