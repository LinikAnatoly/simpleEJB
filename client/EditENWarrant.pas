unit EditENWarrant;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENWarrantController, AdvObj,
    ENDocAttachmentController, ShellAPI, IdFTP, IdBaseComponent, IdComponent,
    IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase;

type
    TfrmENWarrantEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblNumbergen : TLabel;
    edtNumbergen: TEdit;
    lblName : TLabel;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblWarrantPosition : TLabel;
    edtWarrantPosition: TEdit;
    lblPassport : TLabel;
    edtPassport: TEdit;
    lblAddress : TLabel;
    edtAddress: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblPower : TLabel;
    edtPower: TEdit;
    lblMaxSum : TLabel;
    edtMaxSum: TEdit;

    HTTPRIOENWarrant: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblENDepartmentName: TLabel;
    edtENDepartmentName: TEdit;
    spbENDepartment: TSpeedButton;
    lblWarrantStatus: TLabel;
    edtWarrantStatusName: TEdit;
    spbWarrantStatus: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    edtName: TMemo;
    HTTPRIOENWarrantStatus: THTTPRIO;
    lblWarrantShortFIO: TLabel;
    edtWarrantShortFIO: TEdit;
    lblGenitivePosition: TLabel;
    edtGenitivePosition: TMemo;
    gbAttachment: TGroupBox;
    ToolBar6: TToolBar;
    ToolButton26: TToolButton;
    btnAddAttachments: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    sgENDocAttachment: TAdvStringGrid;
    ImageList2: TImageList;
    actAttachment: TActionList;
    actAddAttachments: TAction;
    actLoadAttachments: TAction;
    actDeleteAttachments: TAction;
    HTTPRIOENDocAttachment: THTTPRIO;
    IdFTP1: TIdFTP;
    grpFullName: TGroupBox;
    edtPersonSurname: TEdit;
    edtPersonName: TEdit;
    edtPersonPatronimic: TEdit;
    grpFullNameGenitive: TGroupBox;
    edtPersonSurnameGenitive: TEdit;
    edtPersonNameGenitive: TEdit;
    edtPersonPatronimicGenitive: TEdit;
    edtENDepartmentGenitive: TEdit;
    lblENDepartmentGenitive: TLabel;
    gbAttachments: TGroupBox;
    spbOpen: TSpeedButton;
    lblCommentGen: TLabel;
    lblFile: TLabel;
    edtCommentGen: TEdit;
    edtFileName: TEdit;
    odFile: TOpenDialog;
    btnWorker: TSpeedButton;
    HTTPRIOENHumenItem: THTTPRIO;
    HTTPRIOFINWorker: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbWarrantStatusClick(Sender: TObject);
    procedure actAddAttachmentsExecute(Sender: TObject);
    procedure actLoadAttachmentsExecute(Sender: TObject);
    procedure actDeleteAttachmentsExecute(Sender: TObject);
    procedure updateAttach(Sender: TObject);
    procedure ToolButton29Click(Sender: TObject);

    // Процедуры для работы с элементами управления заполнения ФИО
    procedure valueChange(Sender : TObject; next : TEdit);
    procedure valueBackSpace(Sender : TObject; Key : Word; next : TEdit);
    procedure edtPersonSurnameChange(Sender: TObject);
    procedure edtPersonSurnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPersonNameChange(Sender: TObject);
    procedure edtPersonNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPersonPatronimicChange(Sender: TObject);
    procedure edtPersonPatronimicKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPersonSurnameGenitiveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPersonSurnameGenitiveChange(Sender: TObject);
    procedure edtPersonNameGenitiveChange(Sender: TObject);
    procedure edtPersonNameGenitiveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPersonPatronimicGenitiveChange(Sender: TObject);
    procedure edtPersonPatronimicGenitiveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbOpenClick(Sender: TObject);
    procedure btnWorkerClick(Sender: TObject);
    { Private declarations }
  public
   isForCopy : Boolean;
   {если true - то отображаются только поля для доверенности сторонней организации}
   isForFromSideType : Boolean;
    { Public declarations }
   enwarrantTypeCode : Integer;
    

end;

var
  frmENWarrantEdit: TfrmENWarrantEdit;
  ENWarrantObj: ENWarrant;

       ENDocAttachmentHeaders: array [1..7] of String =
            ( 'Код'
              ,'Коментар до вкладення'
              ,'Посилання на файл'
              ,'Користувач, що додав вкладення'
              ,'Дата додавання'
              ,'Користувач, що змінив вкладення'
              ,'Дата зміни'
            );

       LastCount,ColCount, LastRow : Integer;

implementation


uses Generics.Collections, ShowENDepartment, ENDepartmentController, DMReportsUnit,
     ShowENWarrantStatus, ENWarrantStatusController,
  ENDocAttachmentStatusController, ENConsts, EditDFDocAttachment,
  ENDocAttachment2ENWarrantController, Globals, ENDocAttachmentServerController
  , ENWarrantTypeController
, EditFINWorkerAssignToAll, ENHumenItemController, FINWorkerController,
  ShowFINWorker;

{$R *.dfm}

procedure TfrmENWarrantEdit.valueChange(Sender : TObject; next : TEdit);
var edt : TEdit;
text, value, remString : String;
indx : Integer;
begin
  edt := Sender as TEdit;
  edt.Text := TrimLeft(edt.Text);
  text := edt.Text;
  indx := Pos(' ', text);
  if indx > 0 then begin
    value := trim(copy(text, 0, indx - 1));
    edt.Text := value;
    if Assigned(next) then begin
      remString := trim(copy(text, indx, Length(text)));
      next.SetFocus;
    end;
    if Length(remString) > 0 then next.Text := remString;
  end;

end;

procedure TfrmENWarrantEdit.valueBackSpace(Sender : TObject; Key : Word; next : TEdit);
var edt : TEdit;
begin
  edt := Sender as TEdit;
    if Key = VK_BACK then begin
    if (Length(edt.Text) = 0) and (Assigned(next)) then begin
      next.SetFocus;
      next.SelStart := Length(next.Text);
      next.SelLength := 0;
    end;
  end;
end;

procedure TfrmENWarrantEdit.updateAttach(Sender: TObject);
var
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  ENDocAttachmentList : ENDocAttachmentShortList;
  docAttachmentFilter : ENDocAttachmentFilter;
  i : Integer;
begin
  clearGrid(sgENDocAttachment);

    TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

    docAttachmentFilter := ENDocAttachmentFilter.Create;
    SetNullIntProps(docAttachmentFilter);
    SetNullXSProps(docAttachmentFilter);

    docAttachmentFilter.status := ENDocAttachmentStatusRef.Create;
    docAttachmentFilter.status.code := ENDOCATTACHMENTSTATUS_ACTIVE;

    docAttachmentFilter.conditionSQL := ' code in (select endocattachment2nwrrnt.docattachmentrefcode '+
      ' from endocattachment2nwrrnt where endocattachment2nwrrnt.warrantrefcode = ' + IntToStr(ENWarrantObj.code) + ')';

    ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredList(docAttachmentFilter,0,-1);

    LastCount := High(ENDocAttachmentList.list);

    if LastCount > -1 then
       sgENDocAttachment.RowCount:=LastCount+2
    else
       sgENDocAttachment.RowCount:=2;

     with sgENDocAttachment do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENDocAttachmentList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENDocAttachmentList.list[i].code)
          else
          Cells[0,i+1] := '';
          Cells[1,i+1] := ENDocAttachmentList.list[i].commentGen;
          Cells[2,i+1] := ENDocAttachmentList.list[i].fileLink;
          Cells[3,i+1] := ENDocAttachmentList.list[i].userAdd;
          if ENDocAttachmentList.list[i].dateAdd = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateAdd);
          Cells[5,i+1] := ENDocAttachmentList.list[i].userGen;
          if ENDocAttachmentList.list[i].dateEdit = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateEdit);

          LastRow:=i+1;
          sgENDocAttachment.RowCount:=LastRow+1;
        end;
     ColCount:=ColCount+1;
     sgENDocAttachment.Row:=1;

end;


procedure TfrmENWarrantEdit.FormShow(Sender: TObject);
var TempENDepartment: ENDepartmentControllerSoapPort;
    TempENWarrantStatus: ENWarrantStatusControllerSoapPort;
    FromSideTypeFormResizingParameter : Integer;
begin
  lblCode.Visible := (DialogState <> dsInsert);
  edtCode.Visible := (DialogState <> dsInsert);
  gbAttachment.Visible := (DialogState <> dsInsert);
  gbAttachments.Visible := False;

  SetFloatStyle([edtPower, edtMaxSum]);
  DisableControls([edtCode, edtENDepartmentName, edtWarrantStatusName, edtFileName]);
  SetGridHeaders(ENDocAttachmentHeaders, sgENDocAttachment.ColumnHeaders);

  if DialogState = dsView then
  begin
     DisableControls([spbENDepartment, spbWarrantStatus , btnWorker]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumbergen
      , edtName
      , edtDateStart
      , edtDateFinal
      , edtPersonSurname
      , edtPersonName
      , edtPersonPatronimic
      , edtPersonSurnameGenitive
      , edtPersonNameGenitive
      , edtPersonPatronimicGenitive
      , edtWarrantShortFIO
      , edtWarrantPosition
      , edtWarrantStatusName
      , edtPassport
      , edtAddress
      , edtPower
      , edtMaxSum
      , edtENDepartmentName
      , edtWarrantStatusName
      , edtGenitivePosition
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) or isForCopy then
  begin
      if not isForCopy then
      edtCode.Text := IntToStr(ENWarrantObj.code);

      Self.isForFromSideType := ENWarrantObj.warrantTypeRef.code = ENConsts.ENWARRANT_TYPE_FROM_SIDE;

     if isForCopy then
      Self.enwarrantTypeCode :=  ENWarrantObj.warrantTypeRef.code;

    edtNumbergen.Text := ENWarrantObj.numbergen;
    MakeMultiline(edtName.Lines, ENWarrantObj.name);

      if ENWarrantObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENWarrantObj.dateStart.Year,ENWarrantObj.dateStart.Month,ENWarrantObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      if ENWarrantObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENWarrantObj.dateFinal.Year,ENWarrantObj.dateFinal.Month,ENWarrantObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;

    edtPersonSurname.Text := ENWarrantObj.personSurname;
    edtPersonName.Text := ENWarrantObj.personName;
    edtPersonPatronimic.Text := ENWarrantObj.personPatronimic;

    edtWarrantShortFIO.Text := ENWarrantObj.warrantShortFIO;
    edtWarrantPosition.Text := ENWarrantObj.warrantPosition;

    edtPersonSurnameGenitive.Text := ENWarrantObj.personSurnameGenitive;
    edtPersonNameGenitive.Text := ENWarrantObj.personNameGenitive;
    edtPersonPatronimicGenitive.Text := ENWarrantObj.personPatronimicGenitive;

    MakeMultiline(edtGenitivePosition.Lines, ENWarrantObj.genitivePosition);
    edtPassport.Text := ENWarrantObj.passport;
    edtAddress.Text := ENWarrantObj.address;

    if ENWarrantObj.departmentRef <> nil then
      if ENWarrantObj.departmentRef.code <> low(Integer) then
      begin
        TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
        edtENDepartmentName.Text := TempENDepartment.getObject(ENWarrantObj.departmentRef.code).shortName;
        edtENDepartmentGenitive.Text := ENWarrantObj.departmentNameGenitive;
      end;

    if ENWarrantObj.warrantStatusRef <> nil then
      if ENWarrantObj.warrantStatusRef.code <> low(Integer) then
      begin
        TempENWarrantStatus := HTTPRIOENWarrantStatus as ENWarrantStatusControllerSoapPort;
        edtWarrantStatusName.Text := TempENWarrantStatus.getObject(ENWarrantObj.warrantStatusRef.code).name;
      end;

    if ENWarrantObj.dateGen <> nil then
    begin
      edtDateGen.DateTime:=EncodeDate(ENWarrantObj.dateGen.Year,ENWarrantObj.dateGen.Month,ENWarrantObj.dateGen.Day);
      edtDateGen.checked := true;
    end
    else
    begin
      edtDateGen.DateTime:=SysUtils.Date;
      edtDateGen.checked := false;
    end;

    if ( ENWarrantObj.power <> Low(Integer) ) then
       edtPower.Text := IntToStr(ENWarrantObj.power)
    else
       edtPower.Text := '';
    if ( ENWarrantObj.maxSum <> nil ) then
       edtMaxSum.Text := ENWarrantObj.maxSum.decimalString
    else
       edtMaxSum.Text := '';

       updateAttach(sender);

  end;

    if Self.enwarrantTypeCode = ENConsts.ENWARRANT_TYPE_RQFKORDER then begin
        HideControls([ gbAttachment
                  , lblPassport, edtPassport, lblAddress, edtAddress, lblPower, edtPower
                  , lblMaxSum, edtMaxSum, lblENDepartmentName, edtENDepartmentName, spbENDepartment
                  , edtWarrantStatusName, lblWarrantStatus, spbWarrantStatus
                  , edtENDepartmentGenitive, lblENDepartmentGenitive]);

    // Для доверенностей со стороны форма уменьшается
    FromSideTypeFormResizingParameter := 120;
    Self.Height := Self.Height - FromSideTypeFormResizingParameter;
    lblCode.Top := lblCode.Top - FromSideTypeFormResizingParameter;
    edtCode.Top := edtCode.Top - FromSideTypeFormResizingParameter;
    btnOK.Top := btnOK.Top - FromSideTypeFormResizingParameter;
    btnCancel.Top := btnCancel.Top - FromSideTypeFormResizingParameter;

    if (DialogState = dsInsert) then
    begin
      DenyBlankValues([edtFileName, edtCommentGen]);
      gbAttachments.Visible := false;
      gbAttachments.Left := 15;
      gbAttachments.Top := gbAttachments.Top - FromSideTypeFormResizingParameter;
    end else
//    if (DialogState = dsEdit) or (DialogState = dsView) then
//    begin
//      gbAttachments.Visible := False;
//      gbAttachment.Visible := True;
//      gbAttachment.Top := gbAttachment.Top - FromSideTypeFormResizingParameter;
//    end;

  end;

  if  Self.isForFromSideType then
  begin
    HideControls([edtName, lblName, gbAttachment, lblWarrantShortFIO, edtWarrantShortFIO
              , lblPassport, edtPassport, lblAddress, edtAddress, lblDateStart
              , edtDateStart, lblDateFinal, edtDateFinal, lblPower, edtPower
              , lblMaxSum, edtMaxSum, lblENDepartmentName, edtENDepartmentName, spbENDepartment
              , edtWarrantStatusName, lblWarrantStatus, spbWarrantStatus
              , edtENDepartmentGenitive, lblENDepartmentGenitive]);

    // Для доверенностей со стороны форма уменьшается
    FromSideTypeFormResizingParameter := 120;
    Self.Height := Self.Height - FromSideTypeFormResizingParameter;
    lblCode.Top := lblCode.Top - FromSideTypeFormResizingParameter;
    edtCode.Top := edtCode.Top - FromSideTypeFormResizingParameter;
    btnOK.Top := btnOK.Top - FromSideTypeFormResizingParameter;
    btnCancel.Top := btnCancel.Top - FromSideTypeFormResizingParameter;

    if (DialogState = dsInsert) then
    begin
      DenyBlankValues([edtFileName, edtCommentGen]);
      gbAttachments.Visible := True;
      gbAttachments.Left := 15;
      gbAttachments.Top := gbAttachments.Top - FromSideTypeFormResizingParameter;

      edtPersonSurnameGenitive.Text := '---';
      edtPersonNameGenitive.Text := '---';
      edtPersonPatronimicGenitive.Text := '---';
      edtWarrantPosition.Text := '---';
      edtGenitivePosition.Text := '---';

    end else
    if (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      gbAttachments.Visible := False;
      gbAttachment.Visible := True;
      gbAttachment.Top := gbAttachment.Top - FromSideTypeFormResizingParameter;
    end;

  end;


  if  (Self.enwarrantTypeCode = ENConsts.ENWARRANT_TYPE_DECREE_RESPONS) then
  begin
     lblNumbergen.Caption := 'Номер';
     lblName.Caption:='Назва';

     grpFullName.Caption:= 'Прізвище, ім''я та по-батькові відповідальної особи';
     grpFullNameGenitive.Caption:= 'Прізвище, ім''я та по-батькові відповідальної особи у родовому відмінку';

     lblWarrantPosition.Caption:= 'Посада відповідальної особи';
     lblGenitivePosition.Caption:= 'Посада відповідальної особи у родовому відмінку';

     HideControls([   lblPassport , edtPassport  , edtAddress  , lblAddress  , lblDateStart  , edtDateStart
                    , lblDateFinal , edtDateFinal , lblPower , edtPower , lblMaxSum , edtMaxSum , ToolBar6 , sgENDocAttachment
                    , gbAttachment  ]);

     lblCode.top:= 360;
     edtCode.top:= 360;
     btnOk.top:= 360;
     btnCancel.top:= 360;
     frmENWarrantEdit.Height := 430;

     lblENDepartmentName.top:= lblENDepartmentName.top-89;
     edtENDepartmentName.top:= edtENDepartmentName.top-89;
     spbENDepartment.top:= spbENDepartment.top-89;
     lblWarrantStatus.top:= lblWarrantStatus.top-89;
     edtWarrantStatusName.top:= edtWarrantStatusName.top-89;
     spbWarrantStatus.top:= spbWarrantStatus.top-89;
     lblENDepartmentGenitive.top:= lblENDepartmentGenitive.top-89;
     edtENDepartmentGenitive.top:= edtENDepartmentGenitive.top-89;
  end;

end;



procedure TfrmENWarrantEdit.actAddAttachmentsExecute(Sender: TObject);
begin
  inherited;
  ENDocAttachmentObj := ENDocAttachment.Create;
  ENDocAttachment2ENWar := ENDocAttachment2ENWarrant.Create;
  try
    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
    frmDFDocAttachmentEdit.warCode := ENWarrantObj.code;
    try
      if frmDFDocAttachmentEdit.ShowModal = mrOk then
      begin
        if ENDocAttachmentObj <> nil then
          updateAttach(Sender);
      end;
    finally
      frmDFDocAttachmentEdit.Free;
      frmDFDocAttachmentEdit:=nil;
    end;
  finally
    ENDocAttachmentObj.Free;
    ENDocAttachmentObj := nil;
    ENDocAttachment2ENWar.Free;
    ENDocAttachment2ENWar := nil;
  end;
end;

procedure TfrmENWarrantEdit.actDeleteAttachmentsExecute(Sender: TObject);
var
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  ObjCode : Integer;
begin
  inherited;
  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
  try
    ObjCode := StrToInt(sgENDocAttachment.Cells[0,sgENDocAttachment.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вложение документа) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENDocAttachment.remove(ObjCode);
    updateAttach(Sender);
  end;
end;

procedure TfrmENWarrantEdit.actLoadAttachmentsExecute(Sender: TObject);
var
  i : Integer;
  result, fname, fileName, dir, ftpDir : string;
  ftpClient: TIdFTP;
  FileNames: TStrings;
  fileSize: Integer;
  att : ENDocAttachment;
  serv : ENDocAttachmentServer;
begin
  inherited;
  FileNames := TStringList.Create;

  try
    att := DMReports.getENDocAttachmentByCode(StrToInt(sgENDocAttachment.Cells[0,sgENDocAttachment.Row]));
    if att = nil then Exit;
    serv := DMReports.getENDocAttachmentServerByCode(att.serverRef.code);
    if serv = nil then Exit;
  except
    on EConvertError do Exit;
  end;

  fileName := ExtractFileName(att.fileLink);
  dir :=  ExtractFilePath(StringReplace(att.fileLink, '/', '\', [rfReplaceAll]));
  ftpDir := StringReplace(dir, '\', '/', [rfReplaceAll]);

  i := LastDelimiter('/' + PathDelim + DriveDelim, fileName);
  if (i > 0) and (fileName[i] = '/') then
    fname := Copy(fileName, i+1, MaxInt) else
    fname := '';

  ftpClient := TIdFTP.create(nil);
  try

    with ftpClient do begin
      Host:= serv.serverIp;
      Username:= serv.userName;
      Password:= serv.userPass;
    end;

    ftpClient.Connect();

    ftpClient.Passive := True;
    ftpClient.BeginWork(wmRead);
    ftpClient.ChangeDir('/'+ftpDir);
    ftpClient.List(FileNames, '', False);

    if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
      CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);

    with ftpClient.DirectoryListing do for i := 0 to Count - 1 do
    begin
      fileSize := ftpClient.Size(ftpClient.DirectoryListing[0].FileName);
      ftpClient.Get(ftpClient.DirectoryListing[0].FileName, ExtractFilePath(Application.ExeName)+TempReportsPath+fname, True, False);
    end;

    ftpClient.Disconnect();
  finally
    ftpClient.Free;
  end;

  ShellExecute(0,PChar('open'),PChar('"' + ExtractFilePath(Application.ExeName)+TempReportsPath+fname + '"'),
                nil,nil,SW_SHOWMAXIMIZED);

end;

procedure TfrmENWarrantEdit.btnWorkerClick(Sender: TObject);
 var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f ,f2 : FINWorkerFilter;
   TempFINWorker: FINWorkerControllerSoapPort;
   eType : Integer;
   NVZType: String;
   IsNVZ: Boolean;
   departmentNameString: string;
   departmentCode : string;
   FINWorkerList: FINWorkerShortList;
begin

  inherited;




   f := FINWorkerFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f2 := FINWorkerFilter.Create;
   SetNullIntProps(f2);
   SetNullXSProps(f2);

   TempFINWorker :=  HTTPRIOFINWorker as FINWorkerControllerSoapPort;
  
   frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
   try
     frmFINWorkerShow.dateGet := nil;

     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            /// 15.02.11
            NVZType := GetReturnValue(sgFINWorker,8);
            IsNVZ := false;

            // NET-4396 Запрещаем использовать работников ОВБ на работах других бюджетодержателей
            departmentNameString := GetReturnValue(sgFINWorker,5);
            departmentCode := GetReturnValue(sgFINWorker,6);


            try

              f2.tabNumber :=  GetReturnValue(sgFINWorker,2);
              FINWorkerList := TempFINWorker.getFINWorkerListForENWarrant(f2);
              edtPassport.Text :=  FINWorkerList.list[0].IdentityCardCode_RU + ': № ' +
                                             FINWorkerList.list[0].IdentityCardSeries_RU +
                                             FINWorkerList.list[0].IdentityCardNumber_RU +
                                             ', виданий ' + FINWorkerList.list[0].IdentityCardIssueBy_RU +
                                             'від ' + FINWorkerList.list[0].IdentityCardIssueDate_RU ;
              edtPersonSurname.text:= FINWorkerList.list[0].LastName;
              edtPersonName.text:= FINWorkerList.list[0].FirstName;
              edtPersonPatronimic.text:= FINWorkerList.list[0].MiddleName;
              edtWarrantPosition.text:= GetReturnValue(sgFINWorker,3);
              edtWarrantShortFIO.text:= FINWorkerList.list[0].nameAlias;


            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmENWarrantEdit.edtPersonNameChange(Sender: TObject);
begin
  inherited;
  Self.valueChange(Sender, edtPersonPatronimic);
end;

procedure TfrmENWarrantEdit.edtPersonNameGenitiveChange(Sender: TObject);
begin
  inherited;
  Self.valueChange(Sender, edtPersonPatronimicGenitive);
end;

procedure TfrmENWarrantEdit.edtPersonNameGenitiveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Self.valueBackspace(Sender, Key, edtPersonSurnameGenitive);
end;

procedure TfrmENWarrantEdit.edtPersonNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Self.valueBackspace(Sender, Key, edtPersonSurname);
end;

procedure TfrmENWarrantEdit.edtPersonPatronimicChange(Sender: TObject);
begin
  inherited;
  Self.valueChange(Sender, nil);
end;


procedure TfrmENWarrantEdit.edtPersonPatronimicGenitiveChange(Sender: TObject);
begin
  inherited;
    Self.valueChange(Sender, nil);
end;


procedure TfrmENWarrantEdit.edtPersonPatronimicGenitiveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Self.valueBackspace(Sender, Key, edtPersonNameGenitive);
end;


procedure TfrmENWarrantEdit.edtPersonPatronimicKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Self.valueBackspace(Sender, Key, edtPersonName);
end;


procedure TfrmENWarrantEdit.edtPersonSurnameChange(Sender: TObject);
begin
  inherited;
  Self.valueChange(Sender, edtPersonName);
end;


procedure TfrmENWarrantEdit.edtPersonSurnameGenitiveChange(Sender: TObject);
begin
  inherited;
  Self.valueChange(Sender, edtPersonNameGenitive);
end;


procedure TfrmENWarrantEdit.edtPersonSurnameGenitiveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Self.valueBackspace(Sender, Key, nil);
end;


procedure TfrmENWarrantEdit.edtPersonSurnameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Self.valueBackspace(Sender, Key, nil);
end;


procedure TfrmENWarrantEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  i: Integer;
  TempENWarrant: ENWarrantControllerSoapPort;
  department: ENDepartment;
  status: ENWarrantStatus;
  controls: TList<TWinControl>;
  docAttachment: ENDocAttachment;
  aFile: ENDocAttachmentController.ArrayOfByte;
  MS: TMemoryStream;
  fileName: string;
begin
  controls := TList<TWinControl>.Create();

  if ((not Self.isForFromSideType) and (enwarrantTypeCode <> ENConsts.ENWARRANT_TYPE_DECREE_RESPONS)
                                   and (enwarrantTypeCode <> ENConsts.ENWARRANT_TYPE_RQFKORDER) ) then
    controls.AddRange(
      [edtNumbergen
      ,edtName
      ,edtDateStart
      ,edtDateFinal
      , edtPersonSurname
      , edtPersonName
      , edtPersonPatronimic
      , edtPersonSurnameGenitive
      , edtPersonNameGenitive
      , edtPersonPatronimicGenitive
      ,edtWarrantPosition
      ,edtWarrantStatusName
      ,edtPassport
      ,edtAddress
      ,edtPower
      ,edtMaxSum
      ,edtENDepartmentName
      , edtGenitivePosition
     ])
  else if (enwarrantTypeCode = ENConsts.ENWARRANT_TYPE_DECREE_RESPONS) then
     begin 
      controls.AddRange(
      [ edtPersonSurname
      , edtPersonName
      , edtPersonPatronimic
      , edtPersonSurnameGenitive
      , edtPersonNameGenitive
      , edtPersonPatronimicGenitive
      , edtWarrantPosition
      , edtGenitivePosition
      , edtWarrantStatusName
      , edtENDepartmentName
      , edtENDepartmentGenitive
     ]);
     end
  else begin
    controls.AddRange(
      [edtNumbergen
      , edtPersonSurname
      , edtPersonName
      , edtPersonPatronimic
      , edtPersonSurnameGenitive
      , edtPersonNameGenitive
      , edtPersonPatronimicGenitive
      , edtWarrantPosition
      , edtGenitivePosition
     ]);

     if (enwarrantTypeCode = ENConsts.ENWARRANT_TYPE_RQFKORDER) then
       controls.Add(edtWarrantShortFIO);
  end;

  
  
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues(controls.ToArray())  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;

     ENWarrantObj.numbergen := edtNumbergen.Text; 
     ENWarrantObj.name := edtName.Text;

     if edtdateStart.checked then
     begin 
       if ENWarrantObj.dateStart = nil then
          ENWarrantObj.dateStart := TXSDate.Create;
       ENWarrantObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENWarrantObj.dateStart := nil;

     if edtdateFinal.checked then
     begin 
       if ENWarrantObj.dateFinal = nil then
          ENWarrantObj.dateFinal := TXSDate.Create;
       ENWarrantObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENWarrantObj.dateFinal := nil;

     ENWarrantObj.personSurname := edtPersonSurname.Text;
     ENWarrantObj.personName := edtPersonName.Text;
     ENWarrantObj.personPatronimic := edtPersonPatronimic.text;

     ENWarrantObj.warrantShortFIO := edtWarrantShortFIO.Text;
     ENWarrantObj.warrantPosition := edtWarrantPosition.Text;

     ENWarrantObj.personSurnameGenitive := edtPersonSurnameGenitive.Text;
     ENWarrantObj.personNameGenitive := edtPersonNameGenitive.Text;
     ENWarrantObj.personPatronimicGenitive := edtPersonPatronimicGenitive.text;

     ENWarrantObj.genitivePosition := edtGenitivePosition.Text;
     ENWarrantObj.passport := edtPassport.Text;
     ENWarrantObj.address := edtAddress.Text;
                                                   
     if edtENDepartmentName.Text <> '' then
     begin
         if ENWarrantObj.departmentRef = nil then ENWarrantObj.departmentRef := ENDepartmentRef.Create;
         department := DMReports.getDepartmentByCode(ENWarrantObj.departmentRef.code);
         ENWarrantObj.departmentRef.code := department.code;
         edtENDepartmentName.Text:= department.shortName;
         ENWarrantObj.departmentName:= department.shortName;
         ENWarrantObj.departmentNameGenitive:= edtENDepartmentGenitive.Text;

         if Length(ENWarrantObj.departmentNameGenitive) = 0 then
         begin
          Application.MessageBox(PChar('Потрібно вказати назву підрозділа в родовому відмінку!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          Action:=caNone;
          exit;
         end

     end;

     if edtWarrantStatusName.Text <> '' then
     begin
         if ENWarrantObj.warrantStatusRef = nil then ENWarrantObj.warrantStatusRef := ENWarrantStatusRef.Create;
         status := DMReports.getWarrantStatus(ENWarrantObj.warrantStatusRef.code);
         ENWarrantObj.warrantStatusRef.code := status.code;
         edtWarrantStatusName.Text:= status.name;
     end;

     if edtdateGen.checked then
     begin 
       if ENWarrantObj.dateGen = nil then
          ENWarrantObj.dateGen := TXSDate.Create;
       ENWarrantObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENWarrantObj.dateGen := nil;

     if ( edtPower.Text <> '' ) then
       ENWarrantObj.power := StrToInt(edtPower.Text)
     else
       ENWarrantObj.power := Low(Integer) ;

     if (ENWarrantObj.maxSum = nil ) then
       ENWarrantObj.maxSum := TXSDecimal.Create;
     if edtMaxSum.Text <> '' then
       ENWarrantObj.maxSum.decimalString := edtMaxSum.Text
     else
       ENWarrantObj.maxSum := nil;

     if DialogState = dsInsert then begin
      ENWarrantObj.warrantTypeRef := ENWarrantTypeRef.Create;
      if ((not Self.isForFromSideType ) and ((enwarrantTypeCode <> ENConsts.ENWARRANT_TYPE_RQFKORDER) and
                                             ( enwarrantTypeCode <> ENConsts.ENWARRANT_TYPE_DECREE_RESPONS ))
                              ) then begin
        ENWarrantObj.warrantTypeRef.code := ENWARRANT_TYPE_INNER;
      end 
      else if ( enwarrantTypeCode = ENConsts.ENWARRANT_TYPE_DECREE_RESPONS ) then
       begin
        ENWarrantObj.warrantTypeRef.code := ENConsts.ENWARRANT_TYPE_DECREE_RESPONS;
       end
       else if ( enwarrantTypeCode = ENConsts.ENWARRANT_TYPE_RQFKORDER ) then
       begin
        ENWarrantObj.warrantTypeRef.code := ENConsts.ENWARRANT_TYPE_RQFKORDER;
       end
       else               
        begin
         ENWarrantObj.warrantTypeRef.code := ENWARRANT_TYPE_FROM_SIDE;
        end;
     end;

     if (AnsiCompareStr(AnsiUpperCase(ENWarrantObj.personSurname)
        ,AnsiUpperCase(ENWarrantObj.personSurnameGenitive)) = 0)
      or (AnsiCompareStr(AnsiUpperCase(ENWarrantObj.personName)
        , AnsiUpperCase(ENWarrantObj.personNameGenitive)) = 0)
      or (AnsiCompareStr(AnsiUpperCase(ENWarrantObj.personPatronimic)
        , AnsiUpperCase(ENWarrantObj.personPatronimicGenitive)) = 0) then begin
          if Application.MessageBox(PChar(Format('Один або більше атрибутів ПІБ довіреної ' +
            'особи співпадають у іменому та родовому відмінках: ' +
            '%s%s%s %s%s та %s%s %s%s%s' +
            'Ви дійсно бажаєте зберегти довіреність?'
            , [Chr(10)
            , Chr(10)
            , Format('%s %s %s'
              , [AnsiUpperCase(ENWarrantObj.personSurname)
              , AnsiUpperCase(ENWarrantObj.personName)
              , AnsiUpperCase(ENWarrantObj.personPatronimic)])
            , Chr(10)
            , Chr(10)
            , Chr(10)
            , Chr(10)
            , Format('%s %s %s'
              , [AnsiUpperCase(ENWarrantObj.personSurnameGenitive)
              , AnsiUpperCase(ENWarrantObj.personNameGenitive)
              , AnsiUpperCase(ENWarrantObj.personPatronimicGenitive)])
            , Chr(10)
            , Chr(10)])),
            PChar('Увага!'),MB_ICONWARNING+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then begin
              Action := caNone;
              Exit;
            end;
     end;


     if ((ENWarrantObj.warrantTypeRef.code = ENConsts.ENWARRANT_TYPE_DECREE_RESPONS)  
     and ((ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) ) )then
     begin 
       ENWarrantObj.power:= 0;
       ENWarrantObj.maxsum:=TXSDecimal.Create;
       ENWarrantObj.maxsum.DecimalString:='0';
       if length(edtName.Text)<>0 then
        ENWarrantObj.name:= edtName.Text
       else
        ENWarrantObj.name:= 'Відповідальна особа для розпорядження';

     end;

    if (edtFileName.Text <> '') then
    begin
      docAttachment := ENDocAttachment.Create;
      SetNullIntProps(docAttachment);
      SetNullXSProps(docAttachment);
      docAttachment.commentGen := edtCommentGen.Text;

      fileName := ExtractFileName(edtFileName.Text);

      MS := TMemoryStream.Create;
      try
        MS.LoadFromFile(edtFileName.Text);

        MS.Position := 0;
        SetLength(aFile, MS.Size);
        for i := 0 to MS.Size - 1 do
          MS.Read(aFile[i], 1);
      finally
        FreeAndNil(MS);
      end;
    end else SetLength(aFile, 1);



    if DialogState = dsInsert then
    begin

      ENWarrantObj.code := Low(Integer);

      if (edtFileName.Text = '') then
        ENWarrantObj.code := TempENWarrant.add(ENWarrantObj)
      else
        ENWarrantObj.code := TempENWarrant.add(ENWarrantObj, docAttachment, aFile, fileName);

    end
    else
    if DialogState = dsEdit then
    begin
      TempENWarrant.save(ENWarrantObj);
    end;

  end;
end;


procedure TfrmENWarrantEdit.spbENDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);

   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENWarrantObj.departmentRef = nil then ENWarrantObj.departmentRef := ENDepartmentRef.Create();
               ENWarrantObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;


procedure TfrmENWarrantEdit.spbOpenClick(Sender: TObject);
var
  errorMassage: string;
begin
  inherited;
  if odFile.Execute then
    edtFileName.Text := odFile.FileName;

  errorMassage := #13#10 + #13#10 + 'Помилка в назві файлу або каталогу!' + #13#10 +
    'Назви каталогів і файлів не повинні містити символи (! @ # $ % ^ & * '' ").' + #13#10 +
    'Ім''я каталогу не повинно закінчуватися на . (крапку). ' + #13#10 + #13#10 +
    'Виправте назви і спробуйте ще раз.';

  if (FileExists(ExpandFileName(edtFileName.Text))) then
  begin
    if not checkSizeNoZero(edtFileName.Text) then
    begin
      Application.MessageBox(PChar('Навіщо додавати порожні файли?  Виберіть інший файл!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      edtFileName.Text := '';
    end;
  end else
  begin
    if (ModalResult = MrOk) then
    begin
      edtFileName.Text := '';
      Application.MessageBox(PChar(odFile.FileName + errorMassage),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    end;
  end;
end;


procedure TfrmENWarrantEdit.spbWarrantStatusClick(Sender: TObject);
var frmENWarrantStatusShow : TfrmENWarrantStatusShow;
    f : ENWarrantStatusFilter;
begin
   f := ENWarrantStatusFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   frmENWarrantStatusShow := TfrmENWarrantStatusShow.Create(Application,fmNormal, f);

   try
      with frmENWarrantStatusShow do
        if ShowModal = mrOk then
        begin
            try
                edtWarrantStatusName.Text := GetReturnValue(sgENWarrantStatus,1);
                ENWarrantObj.warrantStatusRef := ENWarrantStatusRef.Create();
                ENWarrantObj.warrantStatusRef.code := StrToInt(GetReturnValue(sgENWarrantStatus,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENWarrantStatusShow.Free;
   end;
end;

procedure TfrmENWarrantEdit.ToolButton29Click(Sender: TObject);
begin
  inherited;
   updateAttach(sender);
end;

end.
