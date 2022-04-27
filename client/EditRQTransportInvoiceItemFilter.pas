
unit EditRQTransportInvoiceItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQTransportInvoiceItemController ;

type
  TfrmRQTransportInvoiceItemFilterEdit = class(TDialogForm)

    lblMaterialName : TLabel;
    edtMaterialName: TEdit;

    lblMeasurementName : TLabel;
    edtMeasurementName: TEdit;

    lblCountFact : TLabel;
    edtCountFact: TEdit;

    lblWeight : TLabel;
    edtWeight: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQTransportInvoiceItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQTransportInvoiceItemFilterEdit: TfrmRQTransportInvoiceItemFilterEdit;
  RQTransportInvoiceItemFilterObj: RQTransportInvoiceItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQTransportInvoiceItemController  ;
}
{$R *.dfm}



procedure TfrmRQTransportInvoiceItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountFact
      ,edtWeight
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtMaterialName.Text := RQTransportInvoiceItemObj.materialName; 



    edtMeasurementName.Text := RQTransportInvoiceItemObj.measurementName; 



    if ( RQTransportInvoiceItemObj.countFact <> nil ) then
       edtCountFact.Text := RQTransportInvoiceItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 



    if ( RQTransportInvoiceItemObj.weight <> nil ) then
       edtWeight.Text := RQTransportInvoiceItemObj.weight.decimalString
    else
       edtWeight.Text := ''; 



    edtCommentGen.Text := RQTransportInvoiceItemObj.commentGen; 



    edtUserGen.Text := RQTransportInvoiceItemObj.userGen; 



      if RQTransportInvoiceItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQTransportInvoiceItemObj.dateEdit.Year,RQTransportInvoiceItemObj.dateEdit.Month,RQTransportInvoiceItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmRQTransportInvoiceItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQTransportInvoiceItemFilterObj.materialName := edtMaterialName.Text; 



     RQTransportInvoiceItemFilterObj.measurementName := edtMeasurementName.Text; 



     if (RQTransportInvoiceItemFilterObj.countFact = nil ) then
       RQTransportInvoiceItemFilterObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       RQTransportInvoiceItemFilterObj.countFact.decimalString := edtCountFact.Text 
     else
       RQTransportInvoiceItemFilterObj.countFact := nil;




     if (RQTransportInvoiceItemFilterObj.weight = nil ) then
       RQTransportInvoiceItemFilterObj.weight := TXSDecimal.Create;
     if edtWeight.Text <> '' then
       RQTransportInvoiceItemFilterObj.weight.decimalString := edtWeight.Text 
     else
       RQTransportInvoiceItemFilterObj.weight := nil;




     RQTransportInvoiceItemFilterObj.commentGen := edtCommentGen.Text; 



     RQTransportInvoiceItemFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQTransportInvoiceItemFilterObj.dateEdit = nil then
          RQTransportInvoiceItemFilterObj.dateEdit := TXSDate.Create;
       RQTransportInvoiceItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQTransportInvoiceItemFilterObj.dateEdit := nil;




  end;
end;




end.