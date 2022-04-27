
unit EditRQOffer;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOfferController, TB2Item, TB2Dock,
  TB2Toolbar, AdvObj ;

type
  TfrmRQOfferEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIORQOffer: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    lblNumberDoc: TLabel;
    edtNumberDoc: TEdit;
    lblNumberProject: TLabel;
    edtNumberProject: TEdit;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    lblOrgName: TLabel;
    edtOrgName: TEdit;
    lblStatusName: TLabel;
    edtStatusName: TEdit;
    alOffers: TActionList;
    actViewOfferItem: TAction;
    actInsertOfferItem: TAction;
    actEditOfferItem: TAction;
    actDeleteOfferItem: TAction;
    actUpdateOfferItem: TAction;
    actCheckAllOfferItems: TAction;
    actUncheckAllOfferItems: TAction;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    sgRQOfferItem: TAdvStringGrid;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    HTTPRIORQOfferItem: THTTPRIO;
    pmOffersItems: TPopupMenu;
    N20: TMenuItem;
    N22: TMenuItem;
    N21: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    spbEmail: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actViewOfferItemExecute(Sender: TObject);
    procedure actEditOfferItemExecute(Sender: TObject);
    procedure actDeleteOfferItemExecute(Sender: TObject);
    procedure actUpdateOfferItemExecute(Sender: TObject);
    procedure actCheckAllOfferItemsExecute(Sender: TObject);
    procedure actUncheckAllOfferItemsExecute(Sender: TObject);
    procedure spbEmailClick(Sender: TObject);
  
  
  private
    { Private declarations }
    procedure UpdateOfferItemsList();
  public
    { Public declarations }
    RQOfferObj: RQOffer;
  end;

var
  frmRQOfferEdit: TfrmRQOfferEdit;
  //RQOfferObj: RQOffer;

implementation

uses RQOfferItemController, ENConsts, EditRQOfferItem, RQOrgEmailsController,
  ShowRQOrgEmails, EditRQOrgEmailsFilter, RQOrg2TypePayController;


{uses  
    EnergyproController, EnergyproController2, RQOfferController  ;
}
{$R *.dfm}

var
  RQOfferItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва матеріалу'
          ,'Од. виміру'
          ,'Кількість у заявці'
          ,'Ціна з ПДВ'
          ,'Планова дата постачання'
          ,'Статус'
        );

procedure TfrmRQOfferEdit.FormDestroy(Sender: TObject);
begin
  inherited;

  if Assigned(RQOfferObj) then
    RQOfferObj.Free;
end;

procedure TfrmRQOfferEdit.FormShow(Sender: TObject);
var
  TempRQOffer: RQOfferControllerSoapPort;
  offerShort: RQOfferShort;
begin
  pcMain.ActivePage := tsMain;

  SetGridHeaders(RQOfferItemHeaders, sgRQOfferItem.ColumnHeaders);

  DisableControls([edtCode, edtNumberDoc, edtNumberProject, edtDateGen, edtOrgName{, edtEmail}, edtStatusName]);

  if (DialogState <> dsEdit) then
  begin
    DisableActions([actEditOfferItem, actDeleteOfferItem, actCheckAllOfferItems, actUncheckAllOfferItems]);
    DisableControls([spbEmail]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtNumberProject
      ,edtDateGen
      ,edtEmail
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQOfferObj.code);
    edtNumberDoc.Text := RQOfferObj.numberDoc;
    edtNumberProject.Text := RQOfferObj.numberProject;

    if RQOfferObj.dateGen <> nil then
    begin
      edtDateGen.DateTime := EncodeDate(RQOfferObj.dateGen.Year, RQOfferObj.dateGen.Month, RQOfferObj.dateGen.Day);
      edtDateGen.Checked := true;
    end
    else
    begin
      edtDateGen.DateTime := SysUtils.Date;
      edtDateGen.Checked := false;
    end;

    edtEmail.Text := RQOfferObj.email;

    /////
    TempRQOffer := HTTPRIORQOffer as RQOfferControllerSoapPort;
    offerShort := TempRQOffer.getShortObject(RQOfferObj.code);

    if offerShort <> nil then
    begin
      edtOrgName.Text := offerShort.orgRefName;
      edtStatusName.Text := offerShort.statusRefName;
    end;
    /////

    MakeMultiline(edtCommentGen.Lines, RQOfferObj.commentGen);

    // Выводим список позиций оферты
    UpdateOfferItemsList;
  end;
end;



procedure TfrmRQOfferEdit.spbEmailClick(Sender: TObject);
var frmRQOrgEmailsShow: TfrmRQOrgEmailsShow;
begin
  RQOrgEmailsFilterObj := RQOrgEmailsFilter.Create;
  SetNullIntProps(RQOrgEmailsFilterObj);
  SetNullXSProps(RQOrgEmailsFilterObj);

  RQOrgEmailsFilterObj.orgRef := RQOrg2TypePayRef.Create;
  RQOrgEmailsFilterObj.orgRef.code := RQOfferObj.orgRef.code;

  frmRQOrgEmailsShow:= TfrmRQOrgEmailsShow.Create(Application, fmNormal, RQOrgEmailsFilterObj);
	try
    frmRQOrgEmailsShow.DisableActions([frmRQOrgEmailsShow.actInsert, frmRQOrgEmailsShow.actEdit, frmRQOrgEmailsShow.actDelete,
                                       frmRQOrgEmailsShow.actFilter, frmRQOrgEmailsShow.actNoFilter]);
    with frmRQOrgEmailsShow do
	    if ShowModal = mrOk then
			begin
        edtEmail.Text := GetReturnValue(sgRQOrgEmails, 1);
      end;
  finally
		frmRQOrgEmailsShow.Free;
  end;
end;

procedure TfrmRQOfferEdit.UpdateOfferItemsList;
var
  TempRQOfferItem: RQOfferItemControllerSoapPort;
  i, j, LastCount: Integer;
  offerItemFilter: RQOfferItemFilter;
  RQOfferItemList: RQOfferItemShortList;
begin
  ClearGrid(sgRQOfferItem);

  if DialogState = dsInsert then Exit;

  TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;

  offerItemFilter := RQOfferItemFilter.Create;
  SetNullIntProps(offerItemFilter);
  SetNullXSProps(offerItemFilter);

  offerItemFilter.offerRef := RQOfferRef.Create;
  offerItemFilter.offerRef.code := RQOfferObj.code;

  offerItemFilter.orderBySQL := 'RQOFFERITEM.MATERIALNAMEOFFER';

  //RQOfferItemList := TempRQOfferItem.getOfferItemsListForOrder(RQOfferObj.orderRef.code);
  RQOfferItemList := TempRQOfferItem.getScrollableFilteredList(offerItemFilter, 0, -1);

  LastCount := High(RQOfferItemList.list);

  if LastCount > -1 then
     sgRQOfferItem.RowCount := LastCount + 2
  else
     sgRQOfferItem.RowCount := 2;

{
        ( 'Код'
          ,'Назва матеріалу'
          ,'Од. виміру'
          ,'Кількість'
          ,'Ціна з ПДВ'
          ,'Планова дата постачання'
          ,'Статус'
        );
}

  with sgRQOfferItem do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      if RQOfferItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOfferItemList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := RQOfferItemList.list[i].materialNameOffer;
      AddCheckBox(1, i + 1, false, false);

      Cells[2,i+1] := RQOfferItemList.list[i].measurementNameOffer;

      if RQOfferItemList.list[i].countFact = nil then
        Cells[3,i+1] := ''
      else
        Cells[3,i+1] := SeparateThousands(RQOfferItemList.list[i].countFact.DecimalString);

      Alignments[3, i + 1] := taRightJustify;

      if RQOfferItemList.list[i].priceWithNds = nil then
        Cells[4,i+1] := ''
      else
        Cells[4,i+1] := SeparateThousands(RQOfferItemList.list[i].priceWithNds.DecimalString);

      Alignments[4, i + 1] := taRightJustify;
      Colors[4, i + 1] := $0080FF80;

      if RQOfferItemList.list[i].plannedDateDelivery = nil then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := XSDate2String(RQOfferItemList.list[i].plannedDateDelivery);

      Cells[6,i+1] := RQOfferItemList.list[i].statusRefName;

      Objects[0,i+1] := TObject(RQOfferItemList.list[i].orderItemRefCode);
    end;

   sgRQOfferItem.Row := 1;
end;

procedure TfrmRQOfferEdit.actCheckAllOfferItemsExecute(Sender: TObject);
begin
  CheckGrid(sgRQOfferItem, 1, true);
end;

procedure TfrmRQOfferEdit.actDeleteOfferItemExecute(Sender: TObject);
Var
  TempRQOfferItem: RQOfferItemControllerSoapPort;
  TempRQOffer: RQOfferControllerSoapPort;
  ObjCode: Integer;
  i: Integer;
  state: Boolean;
  offerObj: RQOffer;
begin
  state := false;

  for i := 1 to sgRQOfferItem.RowCount - 1 do
  begin
    sgRQOfferItem.GetCheckBoxState(1, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б одну строку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити ВСІ вибрані позиції оферти ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;

    state := false;

    for i := 1 to sgRQOfferItem.RowCount - 1 do
    begin
      sgRQOfferItem.GetCheckBoxState(1, i, state);

      if state then
      begin
        try
          ObjCode := StrToInt(sgRQOfferItem.Cells[0, i]);
        except
          on EConvertError do continue;
        end;

        TempRQOfferItem.remove(ObjCode);
      end;
    end;

    /////
    // Если удалили последнюю позицию из оферты, автоматически в серваке удалится и сама оферта
    // (если только на ней нет вложений). Поэтому проверим: если оферты уже нет, то закрываем форму
    TempRQOffer := HTTPRIORQOffer as RQOfferControllerSoapPort;
    offerObj := TempRQOffer.getObject(RQOfferObj.code);

    if offerObj = nil then
    begin
      ModalResult := mrCancel;
      Exit;
    end;
    /////

    actUpdateOfferItemExecute(Sender);
  end;
end;

procedure TfrmRQOfferEdit.actEditOfferItemExecute(Sender: TObject);
Var TempRQOfferItem: RQOfferItemControllerSoapPort;
begin
  frmRQOfferItemEdit := TfrmRQOfferItemEdit.Create(Application, dsEdit);
  try
    TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;
    try
      frmRQOfferItemEdit.RQOfferItemObj := TempRQOfferItem.getObject(StrToInt(sgRQOfferItem.Cells[0, sgRQOfferItem.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmRQOfferItemEdit.ShowModal = mrOk then
    begin
      actUpdateOfferItemExecute(Sender);
    end;
  finally
    frmRQOfferItemEdit.Free;
    frmRQOfferItemEdit := nil;
  end;
end;

procedure TfrmRQOfferEdit.actUncheckAllOfferItemsExecute(Sender: TObject);
begin
  CheckGrid(sgRQOfferItem, 1, false);
end;

procedure TfrmRQOfferEdit.actUpdateOfferItemExecute(Sender: TObject);
begin
  UpdateOfferItemsList;
end;

procedure TfrmRQOfferEdit.actViewOfferItemExecute(Sender: TObject);
Var TempRQOfferItem: RQOfferItemControllerSoapPort;
begin
  frmRQOfferItemEdit := TfrmRQOfferItemEdit.Create(Application, dsView);
  try
    //frmRQOfferItemEdit.RQOfferItemObj := TempRQOfferItem.getObject(ObjCode);
    TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;
    try
      frmRQOfferItemEdit.RQOfferItemObj := TempRQOfferItem.getObject(StrToInt(sgRQOfferItem.Cells[0, sgRQOfferItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmRQOfferItemEdit.ShowModal;
  finally
    frmRQOfferItemEdit.Free;
    frmRQOfferItemEdit := nil;
  end;
end;

procedure TfrmRQOfferEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOffer: RQOfferControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberDoc
      ,edtNumberProject
      ,edtEmail
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQOffer := HTTPRIORQOffer as RQOfferControllerSoapPort;

     {
     RQOfferObj.numberDoc := edtNumberDoc.Text;

     RQOfferObj.numberProject := edtNumberProject.Text;

     if edtdateGen.checked then
     begin
       if RQOfferObj.dateGen = nil then
          RQOfferObj.dateGen := TXSDate.Create;
       RQOfferObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQOfferObj.dateGen := nil;
     }

     RQOfferObj.email := edtEmail.Text;

     RQOfferObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      RQOfferObj.code:=low(Integer);
      TempRQOffer.add(RQOfferObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOffer.save(RQOfferObj);
    end;
  end;
end;


end.