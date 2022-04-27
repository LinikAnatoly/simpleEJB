
unit EditENServices2CalcAdditionalItems;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServices2CalcAdditionalItemsController,
  ENCalcAdditionalItemTypeController ;

type
  TfrmENServices2CalcAdditionalItemsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblSumma : TLabel;
    edtSumma: TEdit;
    lblCountgen : TLabel;
    edtCountgen: TEdit;
    lblComment : TLabel;
    edtComment: TEdit;


  HTTPRIOENServices2CalcAdditionalItems: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbCaclItem: TSpeedButton;
    edtCalcItem: TEdit;
    lblCalcItem: TLabel;
    HTTPRIOENCalcAdditionalItemType: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbCaclItemClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServices2CalcAdditionalItemsEdit: TfrmENServices2CalcAdditionalItemsEdit;
  ENServices2CalcAdditionalItemsObj: ENServices2CalcAdditionalItems;

implementation

uses ShowENCalcAdditionalItemType;



{uses  
    EnergyproController, EnergyproController2, ENServices2CalcAdditionalItemsController  ;
}
{$R *.dfm}



procedure TfrmENServices2CalcAdditionalItemsEdit.FormShow(Sender: TObject);
var
  TempENCalcAdditionalItem: ENCalcAdditionalItemTypeControllerSoapPort;
begin

  DisableControls([edtCode, edtCalcItem]);

  if DialogState = dsView then
  begin
    //DisableControls([;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtCalcItem, edtSumma]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENServices2CalcAdditionalItemsObj.code);
    if ( ENServices2CalcAdditionalItemsObj.summa <> nil ) then
       edtSumma.Text := ENServices2CalcAdditionalItemsObj.summa.decimalString
    else
       edtSumma.Text := '';
    if ( ENServices2CalcAdditionalItemsObj.countgen <> nil ) then
       edtCountgen.Text := ENServices2CalcAdditionalItemsObj.countgen.decimalString
    else
       edtCountgen.Text := '';
    edtComment.Text := ENServices2CalcAdditionalItemsObj.comment;

    TempENCalcAdditionalItem := HTTPRIOENCalcAdditionalItemType as ENCalcAdditionalItemTypeControllerSoapPort;

    if ENServices2CalcAdditionalItemsObj.calcAdditionalItemTypeRef <> nil then
       if ENServices2CalcAdditionalItemsObj.calcAdditionalItemTypeRef.code <> Low(Integer) then
        begin
           edtCalcItem.Text := TempENCalcAdditionalItem.getObject(ENServices2CalcAdditionalItemsObj.calcAdditionalItemTypeRef.code).name;
        end;

  end;
end;



procedure TfrmENServices2CalcAdditionalItemsEdit.spbCaclItemClick(
  Sender: TObject);
var frmENCalcAdditionalItemTypeShow: TfrmENCalcAdditionalItemTypeShow;
begin
  if DialogState = dsView then Exit;

  frmENCalcAdditionalItemTypeShow := TfrmENCalcAdditionalItemTypeShow.Create(Application, fmNormal);

  try
 //   DisableActions([frmENCalcAdditionalItemTypeShow.actInsert, frmENCalcAdditionalItemTypeShow.actEdit,
  //                  frmENCalcAdditionalItemTypeShow.actDelete]);

    with frmENCalcAdditionalItemTypeShow do
      if ShowModal = mrOk then
      begin
        try
          if ENServices2CalcAdditionalItemsObj.calcAdditionalItemTypeRef = nil then
          ENServices2CalcAdditionalItemsObj.calcAdditionalItemTypeRef := ENCalcAdditionalItemTypeRef.Create;
          ENServices2CalcAdditionalItemsObj.calcAdditionalItemTypeRef.code := StrToInt(GetReturnValue(sgENCalcAdditionalItemType, 0));
          edtCalcItem.Text := GetReturnValue(sgENCalcAdditionalItemType, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENCalcAdditionalItemTypeShow.Free;
  end;
end;

procedure TfrmENServices2CalcAdditionalItemsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtCalcItem, edtSumma])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;


     if (ENServices2CalcAdditionalItemsObj.summa = nil ) then
       ENServices2CalcAdditionalItemsObj.summa := TXSDecimal.Create;
     if edtSumma.Text <> '' then
       ENServices2CalcAdditionalItemsObj.summa.decimalString := edtSumma.Text 
     else
       ENServices2CalcAdditionalItemsObj.summa := nil;

     if (ENServices2CalcAdditionalItemsObj.countgen = nil ) then
       ENServices2CalcAdditionalItemsObj.countgen := TXSDecimal.Create;
     if edtCountgen.Text <> '' then
       ENServices2CalcAdditionalItemsObj.countgen.decimalString := edtCountgen.Text 
     else
       ENServices2CalcAdditionalItemsObj.countgen := nil;

     ENServices2CalcAdditionalItemsObj.comment := edtComment.Text; 

    if DialogState = dsInsert then
    begin
      ENServices2CalcAdditionalItemsObj.code:=low(Integer);
      TempENServices2CalcAdditionalItems.add(ENServices2CalcAdditionalItemsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServices2CalcAdditionalItems.save(ENServices2CalcAdditionalItemsObj);
    end;
  end;
end;


end.