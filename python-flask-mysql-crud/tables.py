from flask_table import Table, Col, LinkCol

class Results(Table):
    #id = LinkCol('id', 'user', url_kwargs=dict(id='id'))
    id = LinkCol(
        name='ID',
        attr='id',
        endpoint='user',
        url_kwargs=dict(id='id'),
    )
    name = Col('name')
    email = Col('email')
    password = Col('password', show=False)
    delete = LinkCol('Delete', 'user_delete', url_kwargs=dict(id='id'))