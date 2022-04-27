
unit EditENFuseFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuseController ;

type
  TfrmENFuseFilterEdit = class(TDialogForm)

    lblCurrentFuse : TLabel;
    edtCurrentFuse: TEdit;


  lblENFuseTypeFuseTypeName : TLabel;
  edtENFuseTypeFuseTypeName : TEdit;
  spbENFuseTypeFuseType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENHighVoltageSellHighvoltageSellName : TLabel;
  edtENHighVoltageSellHighvoltageSellName : TEdit;
  spbENHighVoltageSellHighvoltageSell : TSpeedButton;
  

  HTTPRIOENFuse: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENFuseTypeFuseTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFuseFilterEdit: TfrmENFuseFilterEdit;
  ENFuseFilterObj: ENFuseFilter;

implementation

uses
  ShowENFuseType
  ,ENFuseTypeController
  ,ShowENElement
  ,ENElementController
  ,ShowENHighVoltageSell
  ,ENHighVoltageSellController
;

{uses  
    EnergyproController, EnergyproController2, ENFuseController  ;
}
{$R *.dfm}



procedure TfrmENFuseFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCurrentFuse
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENFuseObj.currentFuse <> nil ) then
       edtCurrentFuse.Text := ENFuseObj.currentFuse.decimalString
    else
       edtCurrentFuse.Text := ''; 


  end;

}

end;



procedure TfrmENFuseFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuse: ENFuseControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENFuseFilterObj.currentFuse = nil ) then
       ENFuseFilterObj.currentFuse := TXSDecimal.Create;
     if edtCurrentFuse.Text <> '' then
       ENFuseFilterObj.currentFuse.decimalString := edtCurrentFuse.Text 
     else
       ENFuseFilterObj.currentFuse := nil;





  end;
end;

procedure TfrmENFuseFilterEdit.spbENFuseTypeFuseTypeClick(Sender : TObject);
var 
   frmENFuseTypeShow: TfrmENFuseTypeShow;
begin
   frmENFuseTypeShow:=TfrmENFuseTypeShow.Create(Application,fmNormal);
   try
      with frmENFuseTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuseFilterObj.fuseType = nil then ENFuseFilterObj.fuseType := ENFuseType.Create();
               ENFuseFilterObj.fuseType.code := StrToInt(GetReturnValue(sgENFuseType,0));
               edtENFuseTypeFuseTypeName.Text:=GetReturnValue(sgENFuseType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENFuseTypeShow.Free;
   end;
end;


procedure TfrmENFuseFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuseFilterObj.element = nil then ENFuseFilterObj.element := ENElement.Create();
               ENFuseFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENFuseFilterEdit.spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);
var 
   frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
begin
   frmENHighVoltageSellShow:=TfrmENHighVoltageSellShow.Create(Application,fmNormal);
   try
      with frmENHighVoltageSellShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuseFilterObj.highvoltageSell = nil then ENFuseFilterObj.highvoltageSell := ENHighVoltageSell.Create();
               ENFuseFilterObj.highvoltageSell.code := StrToInt(GetReturnValue(sgENHighVoltageSell,0));
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