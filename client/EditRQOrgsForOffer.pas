unit EditRQOrgsForOffer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Grids, AdvObj, BaseGrid, AdvGrid, InvokeRegistry,
  Rio, SOAPHTTPClient, StdCtrls, TB2Item, TB2Dock, TB2Toolbar, ActnList, ImgList,
  Menus, RQOrderItemController;

type
  TfrmRQOrgsForOfferEdit = class(TDialogForm)
    sgRQOrgs: TAdvStringGrid;
    HTTPRIORQOrg2TypePay: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem8: TTBItem;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    chbCheckAll: TCheckBox;
    Label1: TLabel;
    HTTPRIORQOrderItem: THTTPRIO;
    Label3: TLabel;
    memLog: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure chbCheckAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure UpdateOrgsList;
  public
    { Public declarations }
    materialCode: Integer;
    orderItemsCodes: RQOrderItemController.ArrayOfInteger;
    strOrgCodes: String;
  end;

var
  frmRQOrgsForOfferEdit: TfrmRQOrgsForOfferEdit;

implementation

uses ENConsts, RQOrg2TypePayController, GridHeadersUnit, ShowRQOrg2TypePay,
  ChildFormUnit, EditRQOrg2TypePay;

{$R *.dfm}

var
  RQOrg2TypePayHeaders: array [1..6] of String =
        ( 'Код'
          ,'ПК внешней связи (Фин.Кол)'
          ,'Код организации'
          ,'Контрагент'
          ,'ОКПО'
          ,'E-mail'
        );

procedure TfrmRQOrgsForOfferEdit.actDeleteExecute(Sender: TObject);
var
  ObjCode: Integer;
  i: Integer;
  state: Boolean;
  strCodes: String;
begin
  state := false;

  for i := 1 to sgRQOrgs.RowCount - 1 do
  begin
    sgRQOrgs.GetCheckBoxState(3, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б одну строку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити ВСІ вибрані строки ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    strCodes := '';

    state := false;

    for i := 1 to sgRQOrgs.RowCount - 1 do
    begin
      sgRQOrgs.GetCheckBoxState(3, i, state);

      if not state then
      begin
        try
          ObjCode := StrToInt(sgRQOrgs.Cells[0, i]);
        except
          on EConvertError do continue;
        end;

        AddListPos(strCodes, IntToStr(ObjCode));
      end;
    end;

    strOrgCodes := strCodes;

    actUpdateExecute(Sender);
  end;
end;

procedure TfrmRQOrgsForOfferEdit.actEditExecute(Sender: TObject);
var TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
begin
  TempRQOrg2TypePay := HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;
  try
    RQOrg2TypePayObj := TempRQOrg2TypePay.getObject(StrToInt(sgRQOrgs.Cells[0, sgRQOrgs.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRQOrg2TypePayEdit := TfrmRQOrg2TypePayEdit.Create(Application, dsEdit);
  try
    if frmRQOrg2TypePayEdit.ShowModal= mrOk then
    begin
      //UpdateGrid(Sender);
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrg2TypePayEdit.Free;
    frmRQOrg2TypePayEdit := nil;
  end;
end;

procedure TfrmRQOrgsForOfferEdit.actInsertExecute(Sender: TObject);
var
  frmRQOrg2TypePayShow: TfrmRQOrg2TypePayShow;
  orgCode: Integer;
begin
  frmRQOrg2TypePayShow := TfrmRQOrg2TypePayShow.Create(Application, fmNormal);
  try
    //DisableActions([frmRQOrg2TypePayShow.actInsert, frmRQOrg2TypePayShow.actEdit, frmRQOrg2TypePayShow.actDelete,
    //                frmRQOrg2TypePayShow.actNoFilter, frmRQOrg2TypePayShow.actFilter]);

    with frmRQOrg2TypePayShow do
      if ShowModal = mrOk then
      begin
        try
          orgCode := StrToInt(GetReturnValue(sgRQOrg2TypePay, 0));

          AddListPos(strOrgCodes, IntToStr(orgCode));

          //UpdateOrgsList;
          Self.actUpdateExecute(Sender);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrg2TypePayShow.Free;
  end;
end;

procedure TfrmRQOrgsForOfferEdit.actUpdateExecute(Sender: TObject);
begin
  UpdateOrgsList;
end;

procedure TfrmRQOrgsForOfferEdit.actViewExecute(Sender: TObject);
var TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
begin
  TempRQOrg2TypePay := HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;
  try
    RQOrg2TypePayObj := TempRQOrg2TypePay.getObject(StrToInt(sgRQOrgs.Cells[0, sgRQOrgs.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRQOrg2TypePayEdit := TfrmRQOrg2TypePayEdit.Create(Application, dsView);
  try
    frmRQOrg2TypePayEdit.ShowModal;
  finally
    frmRQOrg2TypePayEdit.Free;
    frmRQOrg2TypePayEdit := nil;
  end;
end;

procedure TfrmRQOrgsForOfferEdit.chbCheckAllClick(Sender: TObject);
begin
  CheckGrid(sgRQOrgs, 3, chbCheckAll.Checked);
end;

procedure TfrmRQOrgsForOfferEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  i, ObjCode, netStrPos: Integer;
  state: Boolean;
  orgName, errorMessage: String;
  strCodes: String;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  begin
    if strOrgCodes = '' then
    begin
      Application.MessageBox(PChar('Додайте хоча б одного постачальника!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    if High(orderItemsCodes) = -1 then
    begin
      Application.MessageBox(PChar('Не заданий перелік позицій заявки!'), PChar('Помилка!'), MB_ICONERROR + MB_OK);
      Action := caNone;
      Exit;
    end;

    if Application.MessageBox(PChar('Сформувати оферти для всіх постачальників зі списку ?'),
                              PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    begin
      Action := caNone;
      Exit;
    end;

    memLog.Clear;

    TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

    strCodes := '';

    for i := 1 to sgRQOrgs.RowCount - 1 do
    begin
      try
        ObjCode := StrToInt(sgRQOrgs.Cells[0, i]);
      except
        on EConvertError do continue;
      end;

      orgName := sgRQOrgs.Cells[3, i];

      try
        TempRQOrderItem.createOffer(orderItemsCodes, ObjCode);
      except
        on E: Exception do
        begin
          errorMessage := E.Message;
          netStrPos := Pos('NET-', errorMessage);
          if netStrPos > 0 then
            errorMessage := Copy(errorMessage, netStrPos, Length(errorMessage) - netStrPos + 1);

          AddListPos(strCodes, IntToStr(ObjCode));

          //memLog.Lines.Add('[ Постачальник: "' + orgName + '" ]: ' + E.Message + #13#10);
          memLog.Lines.Add('[ Постачальник: "' + orgName + '" ]: ' + errorMessage + #13#10);
          Action := caNone;
          continue;
        end;
      end;
    end;

    if strCodes <> '' then
    begin
      strOrgCodes := strCodes;
      actUpdateExecute(Sender);
    end;
  end;
end;

procedure TfrmRQOrgsForOfferEdit.FormCreate(Sender: TObject);
begin
  materialCode := LOW_INT;
  SetLength(orderItemsCodes, 0);
  strOrgCodes := '';
end;

procedure TfrmRQOrgsForOfferEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;

procedure TfrmRQOrgsForOfferEdit.FormShow(Sender: TObject);
begin
  SetGridHeaders(RQOrg2TypePayHeaders, sgRQOrgs.ColumnHeaders);
  DisableControls([memLog]);

  UpdateOrgsList;
end;

procedure TfrmRQOrgsForOfferEdit.UpdateOrgsList;
var
  TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
  org2TypePayFilter: RQOrg2TypePayFilter;
  RQOrg2TypePayList: RQOrg2TypePayShortList;
  i, LastCount: Integer;
begin
  ClearGrid(sgRQOrgs);

  chbCheckAll.Checked := false;

  if (materialCode = LOW_INT) and (strOrgCodes = '') then Exit;

  TempRQOrg2TypePay := HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;

  if strOrgCodes <> '' then
  begin
    org2TypePayFilter := RQOrg2TypePayFilter.Create;
    SetNullIntProps(org2TypePayFilter);
    SetNullXSProps(org2TypePayFilter);

    org2TypePayFilter.conditionSQL := 'RQORG2TYPEPAY.CODE in (' + strOrgCodes + ')';

    RQOrg2TypePayList := TempRQOrg2TypePay.getScrollableFilteredList(org2TypePayFilter, 0, -1);
  end
  else if materialCode <> LOW_INT then
  begin
    RQOrg2TypePayList := TempRQOrg2TypePay.getLastContragentsListByMaterial(materialCode);

    for i := 0 to High(RQOrg2TypePayList.list) do
      AddListPos(strOrgCodes, IntToStr(RQOrg2TypePayList.list[i].code));

    materialCode := LOW_INT;
  end;

  LastCount := High(RQOrg2TypePayList.list);

  if LastCount > -1 then
    sgRQOrgs.RowCount := LastCount + 2
  else
    sgRQOrgs.RowCount := 2;

   with sgRQOrgs do
     for i := 0 to LastCount do
     begin
       Application.ProcessMessages;

       if RQOrg2TypePayList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(RQOrg2TypePayList.list[i].code)
       else
         Cells[0,i+1] := '';

       if RQOrg2TypePayList.list[i].id = Low(Integer) then
         Cells[1,i+1] := ''
       else
         Cells[1,i+1] := IntToStr(RQOrg2TypePayList.list[i].id);

       Cells[2,i+1] := RQOrg2TypePayList.list[i].codeorg;
       Cells[3,i+1] := RQOrg2TypePayList.list[i].name;

       AddCheckBox(3, i+1, false, false);

       Cells[4,i+1] := RQOrg2TypePayList.list[i].okpo;
       Cells[5,i+1] := RQOrg2TypePayList.list[i].email;

       sgRQOrgs.RowCount := i + 2;
    end;

  sgRQOrgs.Row:=1;
end;

end.
