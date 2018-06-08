import boto3
from botocore.exceptions import ClientError
from vars_setup import s3_name, d_tables, awsbackendprofile

# s3 backet
session = boto3.Session(profile_name=awsbackendprofile)
s3 = session.client('s3')
s3.create_bucket(Bucket=s3_name)

# dynamo database
#dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
dynamodb = session.client('dynamodb')

# exection message
def botoexeptionsmessage(call,arg):
  if e.response['Error']['Code'] == 'ResourceInUseException':
    print call + arg + " already exists"

for i in d_tables:
  try:
    print "checking for table " + i + " existance"
    table = dynamodb.describe_table(TableName=i)
  except:
    print "creating table " + i
    print "\n"
    table = dynamodb.create_table(
      TableName=i,
      KeySchema=[
        {
          'AttributeName': 'LockID',
          'KeyType': 'HASH'  #Partition key
        }
      ],
      AttributeDefinitions=[
        {
           'AttributeName': 'LockID',
           'AttributeType': 'S'
        }
      ],
      ProvisionedThroughput={
          'ReadCapacityUnits': 20,
          'WriteCapacityUnits': 20
      }
    )
