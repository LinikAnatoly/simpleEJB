//Прикрепление вложенных файлов в Базу Данных EnergyNet
unit EditENSchemeAttachment;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  ENSchemeAttachmentController, EnergyproController, EnergyproController2;

type
  TfrmENSchemeAttachmentEdit = class(TDialogForm)
    lblCode: TLabel;
    edtCode: TEdit;
    lblUserGen: TLabel;
    edtUserGen: TEdit;
    lblCommentGen: TLabel;
    edtCommentGen: TEdit;
    lblAttachmentDate: TLabel;
    dtpAttachmentDate: TDateTimePicker;
    HTTPRIOENSchemeAttachment: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    spbDocPath: TSpeedButton;
    edtDocPath: TEdit;
    lblDocPath: TLabel;
    odDoc: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDocPathClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var frmENSchemeAttachmentEdit: TfrmENSchemeAttachmentEdit;
  ENSchemeAttachmentObj: ENSchemeAttachment;

  //Возврат имени файла, упаковка-распаковка файлов
  //при помощи функций динамической библиотеки Packer.dll
  //function GetFileName(Name: String): String; stdcall;
  //  external 'Packer.dll' name 'GetFileName';
  //function PackFile(InPath, OutPath: String; archiveWay: Integer = 2): Boolean; stdcall;
  //  external 'Packer.dll' name 'PackFile';
  //function UnpackFile(InPath, OutPath: String; archiveWay: Integer = 2): Boolean; stdcall;
  //  external 'Packer.dll' name 'UnpackFile';

implementation

uses Packer, Crc32;

var vControlSumFileCRC32: Cardinal; //Контрольная сумма файла

{$R *.dfm}

procedure TfrmENSchemeAttachmentEdit.FormShow(Sender: TObject);

begin
  DisableControls([edtDocPath, edtUserGen]);
  if DialogState = dsView then
    DisableControls([spbDocPath, edtCommentGen, dtpAttachmentDate]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtDocPath, edtCommentGen]);

  if (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENSchemeAttachmentObj.code);
      HideControls([lblUserGen, edtUserGen], False);
      edtUserGen.Text := ENSchemeAttachmentObj.userGen;
      edtCommentGen.Text := ENSchemeAttachmentObj.commentGen;
        if ENSchemeAttachmentObj.attachmentDate <> nil then
          begin
            dtpAttachmentDate.DateTime :=
              EncodeDate(ENSchemeAttachmentObj.attachmentDate.Year,
              ENSchemeAttachmentObj.attachmentDate.Month,
              ENSchemeAttachmentObj.attachmentDate.Day);
            dtpAttachmentDate.checked := true;
          end //if ENSchemeAttachmentObj.attachmentDate <> nil then
        else
          begin
            dtpAttachmentDate.DateTime := SysUtils.Date;
            dtpAttachmentDate.checked := False;
          end;
    end; //if (DialogState = dsEdit) or (DialogState = dsView) then
end;



procedure TfrmENSchemeAttachmentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSchemeAttachment: ENSchemeAttachmentControllerSoapPort;
  MS: TMemoryStream; // Буфер для файла
  vSchemeFile: ArrayOfByte;
  i {, fileNameEnd}: Integer;
  AppPath, InPath, OutPath, strFileName, strFileExt: String;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtDocPath, edtCommentGen])  then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы!'),
          PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else //if not NoBlankValues([edtDocPath, edtCommentGen])  then
      begin
        TempENSchemeAttachment :=
          HTTPRIOENSchemeAttachment as ENSchemeAttachmentControllerSoapPort;

        ENSchemeAttachmentObj.userGen := edtUserGen.Text;
        ENSchemeAttachmentObj.commentGen := edtCommentGen.Text;

        if dtpAttachmentDate.Checked then
          begin
            if ENSchemeAttachmentObj.attachmentDate = nil then
               ENSchemeAttachmentObj.attachmentDate := TXSDate.Create;
            ENSchemeAttachmentObj.attachmentDate.XSToNative(
              GetXSDate(dtpAttachmentDate.DateTime));
          end //if dtpAttachmentDate.Checked then
        else
          ENSchemeAttachmentObj.attachmentDate := nil;

        if edtDocPath.Text <> '' then
          begin
            //Имя, тип, признак упакованности
            ENSchemeAttachmentObj.isPacked := 0;
            (*fileNameEnd := 0;
            i := Length(edtDocPath.Text);
            while Copy(edtDocPath.Text, i, 1) <> '\' do
              begin
                if Copy(edtDocPath.Text, i, 1) = '.' then
                  begin
                    ENSchemeAttachmentObj.schemeExt :=
                      Copy(edtDocPath.Text, i + 1, Length(edtDocPath.Text) - i);
                    fileNameEnd := i - 1;
                    Break;
                  end;
                i := i - 1;
                if i = 0 then
                  Break;
              end;
            if i <> 0 then
              begin
                if fileNameEnd <> 0 then
                  ENSchemeAttachmentObj.schemeName :=
                    Copy(edtDocPath.Text, i + 1, fileNameEnd - i)
                else
                  ENSchemeAttachmentObj.schemeName :=
                    Copy(edtDocPath.Text, i + 1, Length(edtDocPath.Text) - i);
              end;*)

            strFileExt := ExtractFileExt(edtDocPath.Text);
            strFileName := ExtractFileName(edtDocPath.Text);
            ENSchemeAttachmentObj.schemeName :=
              Copy(strFileName, 1, Length(strFileName) - Length(strFileExt));
            ENSchemeAttachmentObj.schemeExt :=
              Copy(strFileExt, 2, Length(strFileExt));

            //Побайтное сохранение в файл через буфер
            MS := TMemoryStream.Create;
            try

              AppPath := ExtractFilePath(Application.ExeName);
              if not DirectoryExists(AppPath + 'Schemes\') then
                CreateDir(AppPath + 'Schemes\');
              if not DirectoryExists(AppPath + 'Schemes\Temp\') then
                CreateDir(AppPath + 'Schemes\Temp\');
              InPath := edtDocPath.Text;
              OutPath := AppPath + 'Schemes\Temp\' +
                ChangeFileExt(strFileName, '.zip');

              if PackFile(InPath, OutPath) then
                begin
                  MS.LoadFromFile(OutPath);
                  ENSchemeAttachmentObj.isPacked := 1;
                end
              else
                MS.LoadFromFile(edtDocPath.Text);

              MS.Position := 0;
              SetLength(vSchemeFile, MS.Size);
              for i := 0 to MS.Size - 1 do
                MS.Read(vSchemeFile[i], 1);
              ENSchemeAttachmentObj.schemeFile := vSchemeFile;
            finally
              FreeAndNil(MS);
            end;
          end;

        if DialogState = dsInsert then
          begin
            ENSchemeAttachmentObj.code:=low(Integer);
            TempENSchemeAttachment.add(ENSchemeAttachmentObj);
          end
        else if DialogState = dsEdit then
          TempENSchemeAttachment.save(ENSchemeAttachmentObj);
      end; //else //if not NoBlankValues([edtDocPath, edtCommentGen])  then
end;


procedure TfrmENSchemeAttachmentEdit.spbDocPathClick(Sender: TObject);
var FileExt, FileName: String;
begin
  odDoc.InitialDir := ExtractFilePath(Application.ExeName){''};
  if odDoc.Execute then
    begin
      FileExt := UpperCase(ExtractFileExt(odDoc.FileName));
      if (FileExt = '.EXE') or (FileExt = '.CMD') or (FileExt = '.BAT')
      or (FileExt = '.COM') or (FileExt = '.JS' ) or (FileExt = '.VBS') then
        begin
          Application.MessageBox(
            PChar('Запрещается прикреплять файлы данного типа!'),
            PChar('Внимание!'), MB_ICONWARNING);
          edtDocPath.SetFocus;
          Exit;
        end;

      vControlSumFileCRC32 := Crc32.FileCRC32(odDoc.FileName);
      if vControlSumFileCRC32 = 0 then
        begin
          Application.MessageBox(
            PChar('Запрещается прикреплять пустые файлы!'),
            PChar('Внимание!'), MB_ICONWARNING);
          edtDocPath.SetFocus;
          Exit;
        end;

      edtDocPath.Text := odDoc.FileName;
    end; //if odDoc.Execute then
end;

procedure TfrmENSchemeAttachmentEdit.btnOkClick(Sender: TObject);
begin
  if (edtCommentGen.Text = '')
  and ((frmENSchemeAttachmentEdit.DialogState = dsInsert)
  or (frmENSchemeAttachmentEdit.DialogState = dsEdit)) then
    begin
      Application.MessageBox(
        PChar('Прокомментируйте, пожалуйста, добавляемую схему.'),
        PChar('Внимание!'), MB_ICONWARNING);
      edtCommentGen.SetFocus;
      frmENSchemeAttachmentEdit.ModalResult := mrNone;
      Exit;
    end;
  if (edtDocPath.Text = '')
  and (frmENSchemeAttachmentEdit.DialogState = dsInsert) then
    begin
      Application.MessageBox(
        PChar('Укажите, пожалуйста, путь к файлу.'),
        PChar('Внимание!'), MB_ICONWARNING);
      edtDocPath.SetFocus;
      frmENSchemeAttachmentEdit.ModalResult := mrNone;
      Exit;
    end;
end;

end.