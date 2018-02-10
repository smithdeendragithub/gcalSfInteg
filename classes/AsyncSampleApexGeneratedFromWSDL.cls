//Generated by wsdl2apex

public class AsyncSampleApexGeneratedFromWSDL {
    public class doDivideResponseFuture extends System.WebServiceCalloutFuture {
        public Double getValue() {
            SampleApexGeneratedFromWSDL.doDivideResponse response = (SampleApexGeneratedFromWSDL.doDivideResponse)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
    public class doSubtractResponseFuture extends System.WebServiceCalloutFuture {
        public Double getValue() {
            SampleApexGeneratedFromWSDL.doSubtractResponse response = (SampleApexGeneratedFromWSDL.doSubtractResponse)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
    public class doMultiplyResponseFuture extends System.WebServiceCalloutFuture {
        public Double getValue() {
            SampleApexGeneratedFromWSDL.doMultiplyResponse response = (SampleApexGeneratedFromWSDL.doMultiplyResponse)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
    public class doAddResponseFuture extends System.WebServiceCalloutFuture {
        public Double getValue() {
            SampleApexGeneratedFromWSDL.doAddResponse response = (SampleApexGeneratedFromWSDL.doAddResponse)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
    public class AsyncCalculatorImplPort {
        public String endpoint_x = 'https://th-apex-soap-service.herokuapp.com/service/calculator';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://calculator.services/', 'SampleApexGeneratedFromWSDL'};
        public AsyncSampleApexGeneratedFromWSDL.doDivideResponseFuture beginDoDivide(System.Continuation continuation,Double arg0,Double arg1) {
            SampleApexGeneratedFromWSDL.doDivide request_x = new SampleApexGeneratedFromWSDL.doDivide();
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            return (AsyncSampleApexGeneratedFromWSDL.doDivideResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSampleApexGeneratedFromWSDL.doDivideResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://calculator.services/',
              'doDivide',
              'http://calculator.services/',
              'doDivideResponse',
              'SampleApexGeneratedFromWSDL.doDivideResponse'}
            );
        }
        public AsyncSampleApexGeneratedFromWSDL.doSubtractResponseFuture beginDoSubtract(System.Continuation continuation,Double arg0,Double arg1) {
            SampleApexGeneratedFromWSDL.doSubtract request_x = new SampleApexGeneratedFromWSDL.doSubtract();
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            return (AsyncSampleApexGeneratedFromWSDL.doSubtractResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSampleApexGeneratedFromWSDL.doSubtractResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://calculator.services/',
              'doSubtract',
              'http://calculator.services/',
              'doSubtractResponse',
              'SampleApexGeneratedFromWSDL.doSubtractResponse'}
            );
        }
        public AsyncSampleApexGeneratedFromWSDL.doMultiplyResponseFuture beginDoMultiply(System.Continuation continuation,Double arg0,Double arg1) {
            SampleApexGeneratedFromWSDL.doMultiply request_x = new SampleApexGeneratedFromWSDL.doMultiply();
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            return (AsyncSampleApexGeneratedFromWSDL.doMultiplyResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSampleApexGeneratedFromWSDL.doMultiplyResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://calculator.services/',
              'doMultiply',
              'http://calculator.services/',
              'doMultiplyResponse',
              'SampleApexGeneratedFromWSDL.doMultiplyResponse'}
            );
        }
        public AsyncSampleApexGeneratedFromWSDL.doAddResponseFuture beginDoAdd(System.Continuation continuation,Double arg0,Double arg1) {
            SampleApexGeneratedFromWSDL.doAdd request_x = new SampleApexGeneratedFromWSDL.doAdd();
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            return (AsyncSampleApexGeneratedFromWSDL.doAddResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSampleApexGeneratedFromWSDL.doAddResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://calculator.services/',
              'doAdd',
              'http://calculator.services/',
              'doAddResponse',
              'SampleApexGeneratedFromWSDL.doAddResponse'}
            );
        }
    }
}