unit RQFKOrderDataController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   , RQFKOrderController
   , RQFKOrderItemController
   , RQFKOrderItem2ENEstimateItemController
   , RQFKOrderItemRemainderController
   ;

type

  RQFKOrderItemData = class(TRemotable)
  private
    Fitem : RQFKOrderItem;
    Fremainder : RQFKOrderItemRemainder;
  public
    destructor Destroy; override;
  published
    property item : RQFKOrderItem read Fitem write Fitem;
    property remainder : RQFKOrderItemRemainder read Fremainder write Fremainder;
  end;

  ArrayOfRQFKOrderItemData = array of RQFKOrderItemData;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderData = class(TRemotable)
  private
    Forder : RQFKOrder;
    FbillCode : Integer;
    Fitems :  ArrayOfRQFKOrderItemData;
  public
    destructor Destroy; override;
  published
    property order : RQFKOrder read Forder write Forder;
    property billCode : Integer read FbillCode write FbillCode;
    property items : ArrayOfRQFKOrderItemData read Fitems write Fitems;
  end;

implementation

  destructor RQFKOrderData.Destroy;
  begin
        inherited Destroy;
  end;

  destructor RQFKOrderItemData.Destroy;
  begin
        inherited Destroy;
  end;

initialization

  RemClassRegistry.RegisterXSClass(RQFKOrderData, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderData');
 // RemClassRegistry.RegisterXSClass(RQFKOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderRef');
  //RemClassRegistry.RegisterXSClass(RQFKOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderFilter');
  //RemClassRegistry.RegisterXSClass(RQFKOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderShort');
  //RemClassRegistry.RegisterXSClass(RQFKOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderShortList');
  //RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderShort');

  //InvRegistry.RegisterInterface(TypeInfo(RQFKOrderControllerSoapPort), 'http://ksoe.org/RQFKOrderController/message/', 'UTF-8');
  //InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderControllerSoapPort), 'http://ksoe.org/RQFKOrderController/action/RQFKOrderController.%operationName%');

end.
