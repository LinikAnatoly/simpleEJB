
unit EditENArresterFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENArresterController ;

type
  TfrmENArresterFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  lblENArresterTypeArresterTypeName : TLabel;
  edtENArresterTypeArresterTypeName : TEdit;
  spbENArresterTypeArresterType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENHighVoltageSellHighvoltageSellName : TLabel;
  edtENHighVoltageSellHighvoltageSellName : TEdit;
  spbENHighVoltageSellHighvoltageSell : TSpeedButton;
  

  HTTPRIOENArrester: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENArresterTypeArresterTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENArresterFilterEdit: TfrmENArresterFilterEdit;
  ENArresterFilterObj: ENArresterFilter;

implementation

uses
  ShowENArresterType
  ,ENArresterTypeController
  ,ShowENElement
  ,ENElementController
  ,ShowENHighVoltageSell
  ,ENHighVoltageSellController
;

{uses  
    EnergyproController, EnergyproController2, ENArresterController  ;
}
{$R *.dfm}



procedure TfrmENArresterFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENArresterObj.name; 


  end;

}

end;



procedure TfrmENArresterFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENArrester: ENArresterControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENArresterFilterObj.name := edtName.Text; 




  end;
end;

procedure TfrmENArresterFilterEdit.spbENArresterTypeArresterTypeClick(Sender : TObject);
var 
   frmENArresterTypeShow: TfrmENArresterTypeShow;
begin
   frmENArresterTypeShow:=TfrmENArresterTypeShow.Create(Application,fmNormal);
   try
      with frmENArresterTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENArresterFilterObj.arresterType = nil then ENArresterFilterObj.arresterType := ENArresterType.Create();
               ENArresterFilterObj.arresterType.code := StrToInt(GetReturnValue(sgENArresterType,0));
               edtENArresterTypeArresterTypeName.Text:=GetReturnValue(sgENArresterType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENArresterTypeShow.Free;
   end;
end;


procedure TfrmENArresterFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENArresterFilterObj.element = nil then ENArresterFilterObj.element := ENElement.Create();
               ENArresterFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENArresterFilterEdit.spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);
var 
   frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
begin
   frmENHighVoltageSellShow:=TfrmENHighVoltageSellShow.Create(Application,fmNormal);
   try
      with frmENHighVoltageSellShow do
        if ShowModal = mrOk then
        begin
            try
               if ENArresterFilterObj.highvoltageSell = nil then ENArresterFilterObj.highvoltageSell := ENHighVoltageSell.Create();
               ENArresterFilterObj.highvoltageSell.code := StrToInt(GetReturnValue(sgENHighVoltageSell,0));
               edtENHighVoltageSellHighvoltageSellName.Text:=GetReturnValue(sgENHighVoltageSell,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENHighVoltageSellShow.Free;
   end;
end;





end.