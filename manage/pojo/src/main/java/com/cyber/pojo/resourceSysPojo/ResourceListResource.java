package com.cyber.pojo.resourceSysPojo;

public class ResourceListResource {
    private Resource resource;

    private com.cyber.pojo.resourceSysPojo.ResourceList ResourceList;

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    public com.cyber.pojo.resourceSysPojo.ResourceList getResourceList() {
        return ResourceList;
    }

    public void setResourceList(com.cyber.pojo.resourceSysPojo.ResourceList resourceList) {
        ResourceList = resourceList;
    }

    @Override
    public String toString() {
        return "ResourceListResource{" +
                "resource=" + resource +
                ", ResourceList=" + ResourceList +
                '}';
    }
}

