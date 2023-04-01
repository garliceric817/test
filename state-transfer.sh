kubectl patch casdeployment default --type='json' -p='[{"op": "replace", "path": "/spec/startStateTransfer", "value":true}]'

