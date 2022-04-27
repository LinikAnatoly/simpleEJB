
unit EditENElementFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENElementController;

type
  TfrmENElementFilterEdit = class(TDialogForm)

    lblOrderField : TLabel;
    edtOrderField: TEdit;

    HTTPRIOENElement: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    lblElementType: TLabel;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    lblInvNum: TLabel;
    edtInvNum: TEdit;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    lblENElementBuhName: TLabel;
    edtENElementBuhName: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEPRenClick(Sender: TObject);

  private
    { Private declarations }
  public
   isTransport, isOperative, isWriteOffProtection, isPriConnection : boolean;
   elementType : Integer;
   changeElement : Boolean;
    { Public declarations }

end;

var
  frmENElementFilterEdit: TfrmENElementFilterEdit;
  ENElementFilterObj: ENElementFilter;

implementation

uses ENElementTypeController, ShowENEPRen, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENElementController  ;
}
{$R *.dfm}



procedure TfrmENElementFilterEdit.FormShow(Sender: TObject);
var TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i, idxWriteOffProtection, idxTransport, idxOperative : Integer;
begin

  cbElementType.Clear;

  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  //f.conditionSQL := 'code in (1,2,3,5,6,7,8,9,10,11)';

  if (isPriConnection) then
    f.conditionSQL := 'CODE IN (' + IntToStr(EN_SUBSTATION04) + ',' + IntToStr(EN_SUBSTATION150) + ')'
  else
    f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE;

  f.orderBySQL := 'code';

  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
  for i:=0 to ENElementTypeList.totalCount-1 do
  begin
    cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
  end;

  cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;

  /////// 22.12.11
  idxWriteOffProtection := -1;
  idxTransport := -1;
  idxOperative := -1;

  for i:=0 to cbElementType.Items.Count - 1 do
  begin
    if isTransport then
      if Integer(cbElementType.Items.Objects[i]) = EN_TRANSPORT then
      begin
        idxTransport := i;
        break;
      end;

    if isOperative then
      if Integer(cbElementType.Items.Objects[i]) = EN_OPERATIVE_OBJECT then
      begin
        idxOperative := i;
        break;
      end;

    if isWriteOffProtection then
      if Integer(cbElementType.Items.Objects[i]) = EN_WRITING_NO_OBJECT then
      begin
        idxWriteOffProtection := i;
        break;
      end;

    if changeElement then
      if Integer(cbElementType.Items.Objects[i]) = elementType then
      begin
        elementType := i;
        break;
      end;

  end;
  ///////


  if (isPriConnection) then
    cbElementType.ItemIndex := 0;

  if isTransport then
   begin
     DisableControls([cbElementType]);
     cbElementType.ItemIndex := idxTransport; //10;
   end;

  if isOperative then
   begin
     DisableControls([cbElementType]);
     cbElementType.ItemIndex := idxOperative; //20;
   end;
   if isWriteOffProtection then
   begin
     DisableControls([cbElementType]);
     cbElementType.ItemIndex := idxWriteOffProtection; //26;
   end;

   if changeElement then
   begin
     DisableControls([cbElementType]);
     cbElementType.ItemIndex := elementType;
   end;

  //cbElementType.ItemIndex := 0;

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENElementObj.orderField <> nil ) then
       edtOrderField.Text := ENElementObj.orderField.decimalString
    else
       edtOrderField.Text := ''; 


  end;

}

end;



procedure TfrmENElementFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENElement: ENElementControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
   {
     if (ENElementFilterObj.orderField = nil ) then
       ENElementFilterObj.orderField := TXSDecimal.Create;
     ENElementFilterObj.orderField.decimalString := edtOrderField.Text ;
   }

   if cbElementType.ItemIndex > -1 then
   begin
    if ENElementFilterObj.typeRef = nil then ENElementFilterObj.typeRef := ENElementTypeRef.Create;
    ENElementFilterObj.typeRef.code := Integer(cbElementType.Items.Objects[cbElementType.ItemIndex]);
   end;

    
  end;
end;




procedure TfrmENElementFilterEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENElementFilterObj.renRef = nil then ENElementFilterObj.renRef := EPRenRef.Create();
               ENElementFilterObj.renRef.code  := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

end.
