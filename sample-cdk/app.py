#!/usr/bin/env python3

import aws_cdk as cdk

from sample_cdk.sample_cdk_stack import SampleCdkStack


app = cdk.App()
SampleCdkStack(app, "SampleCdkStack")

app.synth()
