
unit EditRQPurchaseItemTenderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPurchaseItemTenderController ;

type
  TfrmRQPurchaseItemTenderFilterEdit = class(TDialogForm)

    lblIdentid : TLabel;
    edtIdentid: TEdit;

    lblPurchaseName : TLabel;

    lblFinancingSource : TLabel;



  HTTPRIORQPurchaseItemTender: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblIdentid2: TLabel;
    edtIdentid2: TEdit;
    edtPurchaseName: TEdit;
    edtFinancingSource: TEdit;
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
  frmRQPurchaseItemTenderFilterEdit: TfrmRQPurchaseItemTenderFilterEdit;
  RQPurchaseItemTenderFilterObj: RQPurchaseItemTenderFilter;

implementation

uses ShowRQPurchaseItemType, RQPurchaseItemTypeController;


{uses  
    EnergyproController, EnergyproController2, RQPurchaseItemTenderController  ;
}
{$R *.dfm}



procedure TfrmRQPurchaseItemTenderFilterEdit.FormShow(Sender: TObject);

begin
      DisableControls([edtNameItemType]);
{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPurchaseName
      ,edtFinancingSource
      ,edtSumGenWithNds
      ,edtSumFactWithNds
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtIdentid.Text := RQPurchaseItemTenderObj.identid; 



    MakeMultiline(edtPurchaseName.Lines, RQPurchaseItemTenderObj.purchaseName);



    MakeMultiline(edtFinancingSource.Lines, RQPurchaseItemTenderObj.financingSource);



    if ( RQPurchaseItemTenderObj.sumGenWithNds <> nil ) then
       edtSumGenWithNds.Text := RQPurchaseItemTenderObj.sumGenWithNds.decimalString
    else
       edtSumGenWithNds.Text := ''; 



    if ( RQPurchaseItemTenderObj.sumFactWithNds <> nil ) then
       edtSumFactWithNds.Text := RQPurchaseItemTenderObj.sumFactWithNds.decimalString
    else
       edtSumFactWithNds.Text := ''; 



    if ( RQPurchaseItemTenderObj.tentativeYearGen <> Low(Integer) ) then
       edtTentativeYearGen.Text := IntToStr(RQPurchaseItemTenderObj.tentativeYearGen)
    else
       edtTentativeYearGen.Text := '';



    if ( RQPurchaseItemTenderObj.tentativeMonthGen <> Low(Integer) ) then
       edtTentativeMonthGen.Text := IntToStr(RQPurchaseItemTenderObj.tentativeMonthGen)
    else
       edtTentativeMonthGen.Text := '';



    if ( RQPurchaseItemTenderObj.countSymbolForGroup <> Low(Integer) ) then
       edtCountSymbolForGroup.Text := IntToStr(RQPurchaseItemTenderObj.countSymbolForGroup)
    else
       edtCountSymbolForGroup.Text := '';


  end;

}

end;



procedure TfrmRQPurchaseItemTenderFilterEdit.spbItemTypeClick(Sender: TObject);
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
           RQPurchaseItemTenderFilterObj.purchaseItemTypeRef := RQPurchaseItemTypeRef.Create;
           RQPurchaseItemTenderFilterObj.purchaseItemTypeRef.code := StrToInt( GetReturnValue(sgRQPurchaseItemType, 0) );
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmrqItemTypeShow.Free;
   end;
end;


procedure TfrmRQPurchaseItemTenderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPurchaseItemTender: RQPurchaseItemTenderControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPurchaseItemTenderFilterObj.identid := edtIdentid.Text;
     RQPurchaseItemTenderFilterObj.identid2 := edtIdentid2.Text;

     RQPurchaseItemTenderFilterObj.purchaseName := edtPurchaseName.Text;

     RQPurchaseItemTenderFilterObj.financingSource := edtFinancingSource.Text;

  end;
end;




end.