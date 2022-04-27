
unit EditRQPurchaseItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPurchaseItemController ;

type
  TfrmRQPurchaseItemFilterEdit = class(TDialogForm)

    lblPurchaseName : TLabel;
    edtPurchaseName: TMemo;

    lblIdentid2010 : TLabel;
    edtIdentid2010: TEdit;

    lblIdentid2015 : TLabel;
    edtIdentid2015: TEdit;

    lblMaterialNameGen : TLabel;
    edtMaterialNameGen: TMemo;

    lblMeasurementNameGen : TLabel;
    edtMeasurementNameGen: TEdit;


  HTTPRIORQPurchaseItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblNameItemType: TLabel;
    edtNameItemType: TEdit;
    spbItemType: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbItemTypeClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQPurchaseItemFilterEdit: TfrmRQPurchaseItemFilterEdit;
  RQPurchaseItemFilterObj: RQPurchaseItemFilter;

implementation

uses ShowRQPurchaseItemType, RQPurchaseItemTypeController;


{uses  
    EnergyproController, EnergyproController2, RQPurchaseItemController  ;
}
{$R *.dfm}



procedure TfrmRQPurchaseItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPurchaseName
      ,edtCountGen
      ,edtCountFact
      ,edtPriceGenWithoutNds
      ,edtPriceGenWithNds
      ,edtSumGenWithoutNds
      ,edtSumGenWithNds
      ,edtPriceFactWithoutNds
      ,edtPriceFactWithNds
      ,edtSumFactWithoutNds
      ,edtSumFactWithNds
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtPurchaseName.Lines, RQPurchaseItemObj.purchaseName);



    edtIdentid2010.Text := RQPurchaseItemObj.identid2010; 



    edtIdentid2015.Text := RQPurchaseItemObj.identid2015; 



    if ( RQPurchaseItemObj.countGen <> nil ) then
       edtCountGen.Text := RQPurchaseItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( RQPurchaseItemObj.countFact <> nil ) then
       edtCountFact.Text := RQPurchaseItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 



    MakeMultiline(edtMaterialNameGen.Lines, RQPurchaseItemObj.materialNameGen);



    edtMeasurementNameGen.Text := RQPurchaseItemObj.measurementNameGen; 



    if ( RQPurchaseItemObj.priceGenWithoutNds <> nil ) then
       edtPriceGenWithoutNds.Text := RQPurchaseItemObj.priceGenWithoutNds.decimalString
    else
       edtPriceGenWithoutNds.Text := ''; 



    if ( RQPurchaseItemObj.priceGenWithNds <> nil ) then
       edtPriceGenWithNds.Text := RQPurchaseItemObj.priceGenWithNds.decimalString
    else
       edtPriceGenWithNds.Text := ''; 



    if ( RQPurchaseItemObj.sumGenWithoutNds <> nil ) then
       edtSumGenWithoutNds.Text := RQPurchaseItemObj.sumGenWithoutNds.decimalString
    else
       edtSumGenWithoutNds.Text := ''; 



    if ( RQPurchaseItemObj.sumGenWithNds <> nil ) then
       edtSumGenWithNds.Text := RQPurchaseItemObj.sumGenWithNds.decimalString
    else
       edtSumGenWithNds.Text := ''; 



    if ( RQPurchaseItemObj.priceFactWithoutNds <> nil ) then
       edtPriceFactWithoutNds.Text := RQPurchaseItemObj.priceFactWithoutNds.decimalString
    else
       edtPriceFactWithoutNds.Text := ''; 



    if ( RQPurchaseItemObj.priceFactWithNds <> nil ) then
       edtPriceFactWithNds.Text := RQPurchaseItemObj.priceFactWithNds.decimalString
    else
       edtPriceFactWithNds.Text := ''; 



    if ( RQPurchaseItemObj.sumFactWithoutNds <> nil ) then
       edtSumFactWithoutNds.Text := RQPurchaseItemObj.sumFactWithoutNds.decimalString
    else
       edtSumFactWithoutNds.Text := ''; 



    if ( RQPurchaseItemObj.sumFactWithNds <> nil ) then
       edtSumFactWithNds.Text := RQPurchaseItemObj.sumFactWithNds.decimalString
    else
       edtSumFactWithNds.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, RQPurchaseItemObj.commentGen);



    edtUserGen.Text := RQPurchaseItemObj.userGen; 



      if RQPurchaseItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQPurchaseItemObj.dateEdit.Year,RQPurchaseItemObj.dateEdit.Month,RQPurchaseItemObj.dateEdit.Day);
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



procedure TfrmRQPurchaseItemFilterEdit.spbItemTypeClick(Sender: TObject);
var
   frmrqItemTypeShow : TfrmRQPurchaseItemTypeShow;
begin


   frmrqItemTypeShow := TfrmRQPurchaseItemTypeShow.Create(Application, fmNormal);
   try
     with frmrqItemTypeShow do
     begin
       if ShowModal = mrOk then
       begin
         try
           edtNameItemType.Text := GetReturnValue(sgRQPurchaseItemType, 1) ;
           RQPurchaseItemFilterObj.purchaseItemTypeRef := RQPurchaseItemTypeRef.Create;
           RQPurchaseItemFilterObj.purchaseItemTypeRef.code := StrToInt( GetReturnValue(sgRQPurchaseItemType, 0) );
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmrqItemTypeShow.Free;
   end;
end;

procedure TfrmRQPurchaseItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPurchaseItemFilterObj.identid2010 := edtIdentid2010.Text;
     RQPurchaseItemFilterObj.identid2015 := edtIdentid2015.Text;


     if (RQPurchaseItemFilterObj.countGen = nil ) then
       RQPurchaseItemFilterObj.countGen := TXSDecimal.Create;


     RQPurchaseItemFilterObj.materialNameGen := edtMaterialNameGen.Text;


     RQPurchaseItemFilterObj.measurementNameGen := edtMeasurementNameGen.Text;


     if (RQPurchaseItemFilterObj.priceGenWithoutNds = nil ) then
       RQPurchaseItemFilterObj.priceGenWithoutNds := TXSDecimal.Create;


     if (RQPurchaseItemFilterObj.priceGenWithNds = nil ) then
       RQPurchaseItemFilterObj.priceGenWithNds := TXSDecimal.Create;


     if (RQPurchaseItemFilterObj.sumGenWithoutNds = nil ) then
       RQPurchaseItemFilterObj.sumGenWithoutNds := TXSDecimal.Create;
    




     if (RQPurchaseItemFilterObj.sumGenWithNds = nil ) then
       RQPurchaseItemFilterObj.sumGenWithNds := TXSDecimal.Create;





  end;
end;




end.