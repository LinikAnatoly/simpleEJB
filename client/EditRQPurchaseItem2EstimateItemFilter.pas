
unit EditRQPurchaseItem2EstimateItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPurchaseItem2EstimateItemController ;

type
  TfrmRQPurchaseItem2EstimateItemFilterEdit = class(TDialogForm)



  HTTPRIORQPurchaseItem2EstimateItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENBudgetName: TLabel;
    edtOrderName: TEdit;
    spbOrder: TSpeedButton;
    spbOrderClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbOrderClick(Sender: TObject);
    procedure spbOrderClearClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }
    orderCode : Integer;

end;

var
  frmRQPurchaseItem2EstimateItemFilterEdit: TfrmRQPurchaseItem2EstimateItemFilterEdit;
  RQPurchaseItem2EstimateItemFilterObj: RQPurchaseItem2EstimateItemFilter;

implementation

uses ShowRQOrder, RQOrderController, RQOrderKindController, ENConsts;


{uses  
    EnergyproController, EnergyproController2, RQPurchaseItem2EstimateItemController  ;
}
{$R *.dfm}



procedure TfrmRQPurchaseItem2EstimateItemFilterEdit.FormShow(Sender: TObject);

begin
  DisableControls([ edtOrderName ]);
  orderCode := LOW_INT;

{
  DisableControls([ edtOrderName ]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtCountPurchase
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQPurchaseItem2EstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := RQPurchaseItem2EstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';



    if ( RQPurchaseItem2EstimateItemObj.countPurchase <> nil ) then
       edtCountPurchase.Text := RQPurchaseItem2EstimateItemObj.countPurchase.decimalString
    else
       edtCountPurchase.Text := '';



    MakeMultiline(edtStatusComment.Lines, RQPurchaseItem2EstimateItemObj.statusComment);


  end;

   }

end;



procedure TfrmRQPurchaseItem2EstimateItemFilterEdit.spbOrderClearClick(
  Sender: TObject);
begin
  orderCode := LOW_INT;
  edtOrderName.Text := '';
end;

procedure TfrmRQPurchaseItem2EstimateItemFilterEdit.spbOrderClick(
  Sender: TObject);
var
  frmRQOrderShow: TfrmRQOrderShow;
  f: RQOrderFilter;
begin
  f := RQOrderFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.kindRef := RQOrderKindRef.Create;
  f.kindRef.code := Low(Integer);

  frmRQOrderShow :=TfrmRQOrderShow.Create(Application,fmNormal, f);
  try

    with frmRQOrderShow do
      if ShowModal = mrOk then
      begin
        try
          orderCode := StrToInt(GetReturnValue(sgRQOrder,0));
          edtOrderName.Text := GetReturnValue(sgRQOrder,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrderShow.Free;
  end;
end;

procedure TfrmRQPurchaseItem2EstimateItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

//     if (RQPurchaseItem2EstimateItemFilterObj.countGen = nil ) then
//       RQPurchaseItem2EstimateItemFilterObj.countGen := TXSDecimal.Create;
//     if edtCountGen.Text <> '' then
//       RQPurchaseItem2EstimateItemFilterObj.countGen.decimalString := edtCountGen.Text
//     else
//       RQPurchaseItem2EstimateItemFilterObj.countGen := nil;
//
//
//
//
//     if (RQPurchaseItem2EstimateItemFilterObj.countPurchase = nil ) then
//       RQPurchaseItem2EstimateItemFilterObj.countPurchase := TXSDecimal.Create;
//     if edtCountPurchase.Text <> '' then
//       RQPurchaseItem2EstimateItemFilterObj.countPurchase.decimalString := edtCountPurchase.Text
//     else
//       RQPurchaseItem2EstimateItemFilterObj.countPurchase := nil;




//     RQPurchaseItem2EstimateItemFilterObj.statusComment := edtStatusComment.Text;

//      if orderCode <> LOW_INT then
     RQPurchaseItem2EstimateItemFilterObj.orderCode:= orderCode;




  end;
end;




end.