
unit EditRQFKOrderItem2ENEstimateItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderItem2ENEstimateItemController ;

type
  TfrmRQFKOrderItem2ENEstimateItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblSumWithoutNds : TLabel;
    edtSumWithoutNds: TEdit;


  lblENEstimateItemEstimateItemName : TLabel;
  edtENEstimateItemEstimateItemName : TEdit;
  spbENEstimateItemEstimateItem : TSpeedButton;
  

  HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;

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
  frmRQFKOrderItem2ENEstimateItemFilterEdit: TfrmRQFKOrderItem2ENEstimateItemFilterEdit;
  RQFKOrderItem2ENEstimateItemFilterObj: RQFKOrderItem2ENEstimateItemFilter;

implementation

uses
  ShowENEstimateItem
  ,ENEstimateItemController
;

{uses  
    EnergyproController, EnergyproController2, RQFKOrderItem2ENEstimateItemController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderItem2ENEstimateItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtSumWithoutNds
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQFKOrderItem2ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := RQFKOrderItem2ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( RQFKOrderItem2ENEstimateItemObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQFKOrderItem2ENEstimateItemObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := ''; 


  end;

}

end;



procedure TfrmRQFKOrderItem2ENEstimateItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQFKOrderItem2ENEstimateItemFilterObj.countGen = nil ) then
       RQFKOrderItem2ENEstimateItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQFKOrderItem2ENEstimateItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       RQFKOrderItem2ENEstimateItemFilterObj.countGen := nil;




     if (RQFKOrderItem2ENEstimateItemFilterObj.sumWithoutNds = nil ) then
       RQFKOrderItem2ENEstimateItemFilterObj.sumWithoutNds := TXSDecimal.Create;
     if edtSumWithoutNds.Text <> '' then
       RQFKOrderItem2ENEstimateItemFilterObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text 
     else
       RQFKOrderItem2ENEstimateItemFilterObj.sumWithoutNds := nil;





  end;
end;

procedure TfrmRQFKOrderItem2ENEstimateItemFilterEdit.spbENEstimateItemEstimateItemClick(Sender : TObject);
var 
   frmENEstimateItemShow: TfrmENEstimateItemShow;
begin
   frmENEstimateItemShow:=TfrmENEstimateItemShow.Create(Application,fmNormal);
   try
      with frmENEstimateItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderItem2ENEstimateItemFilterObj.estimateItem = nil then RQFKOrderItem2ENEstimateItemFilterObj.estimateItem := ENEstimateItem.Create();
               RQFKOrderItem2ENEstimateItemFilterObj.estimateItem.code := StrToInt(GetReturnValue(sgENEstimateItem,0));
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