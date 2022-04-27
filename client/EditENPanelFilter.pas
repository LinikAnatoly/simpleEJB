
unit EditENPanelFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPanelController ;

type
  TfrmENPanelFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  lblENMarkBusMarkBusName : TLabel;
  edtENMarkBusMarkBusName : TEdit;
  spbENMarkBusMarkBus : TSpeedButton;
  
  lblENPanelTypePanelTypeName : TLabel;
  edtENPanelTypePanelTypeName : TEdit;
  spbENPanelTypePanelType : TSpeedButton;
  
  lblENArresterTypeArresterTypeName : TLabel;
  edtENArresterTypeArresterTypeName : TEdit;
  spbENArresterTypeArresterType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENPanel: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENMarkBusMarkBusClick(Sender : TObject);
  procedure spbENPanelTypePanelTypeClick(Sender : TObject);
  procedure spbENArresterTypeArresterTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPanelFilterEdit: TfrmENPanelFilterEdit;
  ENPanelFilterObj: ENPanelFilter;

implementation

uses
  ShowENMarkBus
  ,ENMarkBusController
  ,ShowENPanelType
  ,ENPanelTypeController
  ,ShowENArresterType
  ,ENArresterTypeController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENPanelController  ;
}
{$R *.dfm}



procedure TfrmENPanelFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENPanelObj.name; 


  end;

}

end;



procedure TfrmENPanelFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPanel: ENPanelControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPanelFilterObj.name := edtName.Text; 




  end;
end;

procedure TfrmENPanelFilterEdit.spbENMarkBusMarkBusClick(Sender : TObject);
var 
   frmENMarkBusShow: TfrmENMarkBusShow;
begin
   frmENMarkBusShow:=TfrmENMarkBusShow.Create(Application,fmNormal);
   try
      with frmENMarkBusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPanelFilterObj.markBus = nil then ENPanelFilterObj.markBus := ENMarkBus.Create();
               ENPanelFilterObj.markBus.code := StrToInt(GetReturnValue(sgENMarkBus,0));
               edtENMarkBusMarkBusName.Text:=GetReturnValue(sgENMarkBus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMarkBusShow.Free;
   end;
end;


procedure TfrmENPanelFilterEdit.spbENPanelTypePanelTypeClick(Sender : TObject);
var 
   frmENPanelTypeShow: TfrmENPanelTypeShow;
begin
   frmENPanelTypeShow:=TfrmENPanelTypeShow.Create(Application,fmNormal);
   try
      with frmENPanelTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPanelFilterObj.panelType = nil then ENPanelFilterObj.panelType := ENPanelType.Create();
               ENPanelFilterObj.panelType.code := StrToInt(GetReturnValue(sgENPanelType,0));
               edtENPanelTypePanelTypeName.Text:=GetReturnValue(sgENPanelType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPanelTypeShow.Free;
   end;
end;


procedure TfrmENPanelFilterEdit.spbENArresterTypeArresterTypeClick(Sender : TObject);
var 
   frmENArresterTypeShow: TfrmENArresterTypeShow;
begin
   frmENArresterTypeShow:=TfrmENArresterTypeShow.Create(Application,fmNormal);
   try
      with frmENArresterTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPanelFilterObj.arresterType = nil then ENPanelFilterObj.arresterType := ENArresterType.Create();
               ENPanelFilterObj.arresterType.code := StrToInt(GetReturnValue(sgENArresterType,0));
               edtENArresterTypeArresterTypeName.Text:=GetReturnValue(sgENArresterType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENArresterTypeShow.Free;
   end;
end;


procedure TfrmENPanelFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPanelFilterObj.element = nil then ENPanelFilterObj.element := ENElement.Create();
               ENPanelFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.