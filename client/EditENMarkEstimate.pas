
unit EditENMarkEstimate;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts,
	  EnergyproController, EnergyproController2, ENMarkEstimateController;

type
  TfrmENMarkEstimateEdit = class(TDialogForm)
  
  lblCode : TLabel;
	edtCode : TEdit;

  lblENMarkMarkName : TLabel;
  edtENMarkMarkName : TEdit;
  spbENMarkMark : TSpeedButton;
  
  lblENEstimateItemEstimateItemName : TLabel;
  edtENEstimateItemCode: TEdit;
  spbENEstimateItemEstimateItem : TSpeedButton;
  

  HTTPRIOENMarkEstimate: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENMarkMarkClick(Sender : TObject);
  procedure spbENEstimateItemEstimateItemClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }


end;

var
  frmENMarkEstimateEdit: TfrmENMarkEstimateEdit;
  ENMarkEstimateObj: ENMarkEstimate;
  estimateCode : Integer; 

implementation

uses
  ShowENMark
  ,ENMarkController
  ,ShowENEstimateItem
  ,ENEstimateItemController
;

{uses  
    EnergyproController, EnergyproController2, ENMarkEstimateController  ;
}
{$R *.dfm}



procedure TfrmENMarkEstimateEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtENEstimateItemCode, spbENEstimateItemEstimateItem, edtCode]);

  if estimateCode <> LOW_INT then
    edtENEstimateItemCode.Text := IntToStr(estimateCode);

  if DialogState = dsView then
  begin
    DisableControls([
      edtENMarkMarkName
      ,spbENMarkMark
      ,edtENEstimateItemCode
      ,spbENEstimateItemEstimateItem
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENMarkMarkName]);
    DenyBlankValues([edtENMarkMarkName]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENMarkEstimateObj.code);
    edtENMarkMarkName.Text := ENMarkEstimateObj.mark.name;
  end;
end;



procedure TfrmENMarkEstimateEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMarkEstimate: ENMarkEstimateControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENMarkEstimate := HTTPRIOENMarkEstimate as ENMarkEstimateControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENMarkEstimateObj.code:=low(Integer);
      TempENMarkEstimate.add(ENMarkEstimateObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMarkEstimate.save(ENMarkEstimateObj);
    end;

  end;
end;


procedure TfrmENMarkEstimateEdit.spbENMarkMarkClick(Sender : TObject);
var 
   frmENMarkShow: TfrmENMarkShow;
begin
   frmENMarkShow:=TfrmENMarkShow.Create(Application,fmNormal);
   try
      with frmENMarkShow do
        if ShowModal = mrOk then
        begin
            try
               ENMarkEstimateObj :=  ENMarkEstimate.Create();
               ENMarkEstimateObj.mark := ENMark.Create();
               ENMarkEstimateObj.estimateItem := ENEstimateItem.Create();

               ENMarkEstimateObj.mark.code := StrToInt(GetReturnValue(sgENMark,0));
               edtENMarkMarkName.Text:=GetReturnValue(sgENMark,1);
               ENMarkEstimateObj.estimateItem.code := estimateCode;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMarkShow.Free;
   end;
end;



procedure TfrmENMarkEstimateEdit.spbENEstimateItemEstimateItemClick(Sender : TObject);
var 
   frmENEstimateItemShow: TfrmENEstimateItemShow;
begin
   frmENEstimateItemShow:=TfrmENEstimateItemShow.Create(Application,fmNormal);
   try
      with frmENEstimateItemShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMarkEstimateObj.estimateItem = nil then ENMarkEstimateObj.estimateItem := ENEstimateItem.Create();
               ENMarkEstimateObj.estimateItem.code := StrToInt(GetReturnValue(sgENEstimateItem,0));
               //edtENEstimateItemEstimateItemName.Text:=GetReturnValue(sgENEstimateItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENEstimateItemShow.Free;
   end;
end;



end.
