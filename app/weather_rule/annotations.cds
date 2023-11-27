using WeatherService as service from '../../srv/weather_srv';

annotate service.RuleConfig with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'sKey',
            Value : sKey,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Client',
            Value : Client,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Rule',
            Value : Rule,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Disabled',
            Value : Disabled,
        },
    ]
);
annotate service.RuleConfig with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'sKey',
                Value : sKey,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Client',
                Value : Client,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Rule',
                Value : Rule,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Disabled',
                Value : Disabled,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Granularity',
                Value : Granularity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TimeShift',
                Value : TimeShift,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PastHorizon',
                Value : PastHorizon,
            },
            {
                $Type : 'UI.DataField',
                Label : 'FutureHorizon',
                Value : FutureHorizon,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LocationHierarchyID',
                Value : LocationHierarchyID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ProductHierarchyID',
                Value : ProductHierarchyID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OrderChannelID',
                Value : OrderChannelID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SalesOrgID',
                Value : SalesOrgID,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
