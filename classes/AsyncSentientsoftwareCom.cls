//Generated by wsdl2apex

public class AsyncSentientsoftwareCom {
    public class HelloWorldResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            sentientsoftwareCom.HelloWorldResponse_element response = (sentientsoftwareCom.HelloWorldResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.HelloWorldResult;
        }
    }
    public class GetProjectsResponse_elementFuture extends System.WebServiceCalloutFuture {
        public sentientsoftwareCom.ArrayOfSentientProject getValue() {
            sentientsoftwareCom.GetProjectsResponse_element response = (sentientsoftwareCom.GetProjectsResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.GetProjectsResult;
        }
    }
    public class CreateProjectResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            sentientsoftwareCom.CreateProjectResponse_element response = (sentientsoftwareCom.CreateProjectResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.CreateProjectResult;
        }
    }
    public class UpdateProjectResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            sentientsoftwareCom.UpdateProjectResponse_element response = (sentientsoftwareCom.UpdateProjectResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.UpdateProjectResult;
        }
    }
    public class MoveProjectResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            sentientsoftwareCom.MoveProjectResponse_element response = (sentientsoftwareCom.MoveProjectResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.MoveProjectResult;
        }
    }
    public class AsyncProjectServiceSoap {
        public String endpoint_x = 'https://aimiauat.sentientppm.com.au/sentient.salesforce/services/projectservice.asmx';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://sentientsoftware.com/', 'sentientsoftwareCom'};
        public AsyncSentientsoftwareCom.HelloWorldResponse_elementFuture beginHelloWorld(System.Continuation continuation) {
            sentientsoftwareCom.HelloWorld_element request_x = new sentientsoftwareCom.HelloWorld_element();
            return (AsyncSentientsoftwareCom.HelloWorldResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSentientsoftwareCom.HelloWorldResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://sentientsoftware.com/HelloWorld',
              'http://sentientsoftware.com/',
              'HelloWorld',
              'http://sentientsoftware.com/',
              'HelloWorldResponse',
              'sentientsoftwareCom.HelloWorldResponse_element'}
            );
        }
        public AsyncSentientsoftwareCom.GetProjectsResponse_elementFuture beginGetProjects(System.Continuation continuation,sentientsoftwareCom.ArrayOfInt projectIds,String salesForceUsername) {
            sentientsoftwareCom.GetProjects_element request_x = new sentientsoftwareCom.GetProjects_element();
            request_x.projectIds = projectIds;
            request_x.salesForceUsername = salesForceUsername;
            return (AsyncSentientsoftwareCom.GetProjectsResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSentientsoftwareCom.GetProjectsResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://sentientsoftware.com/GetProjects',
              'http://sentientsoftware.com/',
              'GetProjects',
              'http://sentientsoftware.com/',
              'GetProjectsResponse',
              'sentientsoftwareCom.GetProjectsResponse_element'}
            );
        }
        public AsyncSentientsoftwareCom.CreateProjectResponse_elementFuture beginCreateProject(System.Continuation continuation,sentientsoftwareCom.SentientProject serviceProject,String salesForceUsername) {
            sentientsoftwareCom.CreateProject_element request_x = new sentientsoftwareCom.CreateProject_element();
            request_x.serviceProject = serviceProject;
            request_x.salesForceUsername = salesForceUsername;
            return (AsyncSentientsoftwareCom.CreateProjectResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSentientsoftwareCom.CreateProjectResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://sentientsoftware.com/CreateProject',
              'http://sentientsoftware.com/',
              'CreateProject',
              'http://sentientsoftware.com/',
              'CreateProjectResponse',
              'sentientsoftwareCom.CreateProjectResponse_element'}
            );
        }
        public AsyncSentientsoftwareCom.UpdateProjectResponse_elementFuture beginUpdateProject(System.Continuation continuation,Integer sentientProjectId,sentientsoftwareCom.SentientProject serviceProject,String salesForceUsername) {
            sentientsoftwareCom.UpdateProject_element request_x = new sentientsoftwareCom.UpdateProject_element();
            request_x.sentientProjectId = sentientProjectId;
            request_x.serviceProject = serviceProject;
            request_x.salesForceUsername = salesForceUsername;
            return (AsyncSentientsoftwareCom.UpdateProjectResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSentientsoftwareCom.UpdateProjectResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://sentientsoftware.com/UpdateProject',
              'http://sentientsoftware.com/',
              'UpdateProject',
              'http://sentientsoftware.com/',
              'UpdateProjectResponse',
              'sentientsoftwareCom.UpdateProjectResponse_element'}
            );
        }
        public AsyncSentientsoftwareCom.MoveProjectResponse_elementFuture beginMoveProject(System.Continuation continuation,Integer projectId,Integer actionId,String salesForceUsername) {
            sentientsoftwareCom.MoveProject_element request_x = new sentientsoftwareCom.MoveProject_element();
            request_x.projectId = projectId;
            request_x.actionId = actionId;
            request_x.salesForceUsername = salesForceUsername;
            return (AsyncSentientsoftwareCom.MoveProjectResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSentientsoftwareCom.MoveProjectResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://sentientsoftware.com/MoveProject',
              'http://sentientsoftware.com/',
              'MoveProject',
              'http://sentientsoftware.com/',
              'MoveProjectResponse',
              'sentientsoftwareCom.MoveProjectResponse_element'}
            );
        }
    }
}