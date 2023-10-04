#!/usr/bin/env python3

import aws_cdk as cdk

from cdk_eks.cdk_eks_stack import CdkEksStack


app = cdk.App()
CdkEksStack(app, "CdkEksStack")

app.synth()
