
unit EditRQFKOrderItemRemainderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderItemRemainderController ;

type
  TfrmRQFKOrderItemRemainderFilterEdit = class(TDialogForm)

    lblMaterialNameTxt : TLabel;
    edtMaterialNameTxt: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblPriceWithoutNds : TLabel;
    edtPriceWithoutNds: TEdit;

    lblSumWithoutNds : TLabel;
    edtSumWithoutNds: TEdit;


  lblENDepartmentBudgetName : TLabel;
  edtENDepartmentBudgetName : TEdit;
  spbENDepartmentBudget : TSpeedButton;
  

  HTTPRIORQFKOrderItemRemainder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentBudgetClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQFKOrderItemRemainderFilterEdit: TfrmRQFKOrderItemRemainderFilterEdit;
  RQFKOrderItemRemainderFilterObj: RQFKOrderItemRemainderFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
;

{uses  
    EnergyproController, EnergyproController2, RQFKOrderItemRemainderController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderItemRemainderFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtPriceWithoutNds
      ,edtSumWithoutNds
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtMaterialNameTxt.Text := RQFKOrderItemRemainderObj.materialNameTxt; 



    if ( RQFKOrderItemRemainderObj.countGen <> nil ) then
       edtCountGen.Text := RQFKOrderItemRemainderObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( RQFKOrderItemRemainderObj.priceWithoutNds <> nil ) then
       edtPriceWithoutNds.Text := RQFKOrderItemRemainderObj.priceWithoutNds.decimalString
    else
       edtPriceWithoutNds.Text := ''; 



    if ( RQFKOrderItemRemainderObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQFKOrderItemRemainderObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := ''; 


  end;

}

end;



procedure TfrmRQFKOrderItemRemainderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQFKOrderItemRemainderFilterObj.materialNameTxt := edtMaterialNameTxt.Text; 



     if (RQFKOrderItemRemainderFilterObj.countGen = nil ) then
       RQFKOrderItemRemainderFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQFKOrderItemRemainderFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       RQFKOrderItemRemainderFilterObj.countGen := nil;




     if (RQFKOrderItemRemainderFilterObj.priceWithoutNds = nil ) then
       RQFKOrderItemRemainderFilterObj.priceWithoutNds := TXSDecimal.Create;
     if edtPriceWithoutNds.Text <> '' then
       RQFKOrderItemRemainderFilterObj.priceWithoutNds.decimalString := edtPriceWithoutNds.Text 
     else
       RQFKOrderItemRemainderFilterObj.priceWithoutNds := nil;




     if (RQFKOrderItemRemainderFilterObj.sumWithoutNds = nil ) then
       RQFKOrderItemRemainderFilterObj.sumWithoutNds := TXSDecimal.Create;
     if edtSumWithoutNds.Text <> '' then
       RQFKOrderItemRemainderFilterObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text 
     else
       RQFKOrderItemRemainderFilterObj.sumWithoutNds := nil;





  end;
end;

procedure TfrmRQFKOrderItemRemainderFilterEdit.spbENDepartmentBudgetClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderItemRemainderFilterObj.budget = nil then RQFKOrderItemRemainderFilterObj.budget := ENDepartment.Create();
               //RQFKOrderItemRemainderFilterObj.budget.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentBudgetName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;





end.