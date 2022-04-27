
unit EditRQInvoiceItem2ENEstimateItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQInvoiceItem2ENEstimateItemController ;

type
  TfrmRQInvoiceItem2ENEstimateItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;


  lblENEstimateItemEstimateItemName : TLabel;
  edtENEstimateItemEstimateItemName : TEdit;
  spbENEstimateItemEstimateItem : TSpeedButton;
  

  HTTPRIORQInvoiceItem2ENEstimateItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENEstimateItemEstimateItemClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQInvoiceItem2ENEstimateItemFilterEdit: TfrmRQInvoiceItem2ENEstimateItemFilterEdit;
  RQInvoiceItem2ENEstimateItemFilterObj: RQInvoiceItem2ENEstimateItemFilter;

implementation

uses
  ShowENEstimateItem
  ,ENEstimateItemController
;

{uses  
    EnergyproController, EnergyproController2, RQInvoiceItem2ENEstimateItemController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceItem2ENEstimateItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQInvoiceItem2ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := RQInvoiceItem2ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 


  end;

}

end;



procedure TfrmRQInvoiceItem2ENEstimateItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQInvoiceItem2ENEstimateItemFilterObj.countGen = nil ) then
       RQInvoiceItem2ENEstimateItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQInvoiceItem2ENEstimateItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       RQInvoiceItem2ENEstimateItemFilterObj.countGen := nil;





  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemFilterEdit.spbENEstimateItemEstimateItemClick(Sender : TObject);
var 
   frmENEstimateItemShow: TfrmENEstimateItemShow;
begin
   frmENEstimateItemShow:=TfrmENEstimateItemShow.Create(Application,fmNormal);
   try
      with frmENEstimateItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQInvoiceItem2ENEstimateItemFilterObj.estimateItem = nil then RQInvoiceItem2ENEstimateItemFilterObj.estimateItem := ENEstimateItem.Create();
               RQInvoiceItem2ENEstimateItemFilterObj.estimateItem.code := StrToInt(GetReturnValue(sgENEstimateItem,0));
               edtENEstimateItemEstimateItemName.Text:=GetReturnValue(sgENEstimateItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENEstimateItemShow.Free;
   end;
end;





end.