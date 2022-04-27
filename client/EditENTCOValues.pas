
unit EditENTCOValues;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENTCOValuesController ;

type
  TfrmENTCOValuesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDescription : TLabel;
    edtDescription: TMemo;


  HTTPRIOENTCOValues: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    Label1: TLabel;
    edtTCOValuesTypeName: TEdit;
    spbENTCOValuesType: TSpeedButton;
    spbTCOValuesTypeClear: TSpeedButton;
    HTTPRIOENTCOValuesType: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENTCOValuesTypeClick(Sender: TObject);
    procedure spbTCOValuesTypeClearClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTCOValuesEdit: TfrmENTCOValuesEdit;
  ENTCOValuesObj: ENTCOValues;

const
  //Пункт №
  WORK_WITH_CONNECTION_ITEM_1 = 1;
  WORK_WITH_CONNECTION_ITEM_2 = 6;
  WORK_WITH_CONNECTION_ITEM_3 = 7;
  WORK_WITH_CONNECTION_ITEM_4 = 8;
  WORK_WITH_CONNECTION_ITEM_5 = 9;
  WORK_WITH_CONNECTION_ITEM_6 = 10;
  WORK_WITH_CONNECTION_ITEM_7 = 11;
  WORK_WITH_CONNECTION_ITEM_8 = 12;
  WORK_WITH_CONNECTION_ITEM_9 = 13;
  WORK_WITH_CONNECTION_ITEM_10 = 14;

implementation

uses ShowENTCOValuesType, ENTCOValuesTypeController, ENTechConditionsObjectsController;

{$R *.dfm}



procedure TfrmENTCOValuesEdit.FormShow(Sender: TObject);
var
  TempENTCOValuesType: ENTCOValuesTypeControllerSoapPort;
  ENTCOValuesTypeObj : ENTCOValuesType;
  TempENTCOValues: ENTCOValuesControllerSoapPort;
  i, tcoValLastCount, tcoValuesTypeCode: Integer;
  ENTCOValuesList: ENTCOValuesShortList;
  tcoValuesFilter : ENTCOValuesFilter;
begin

  if DialogState = dsView then
  begin
      DisableControls([edtDescription,edtTCOValuesTypeName]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtTCOValuesTypeName
     ]);
   end;

    if DialogState = dsInsert then
    begin
        TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;

        tcoValuesFilter := ENTCOValuesFilter.Create;
        SetNullIntProps(tcoValuesFilter);
        SetNullXSProps(tcoValuesFilter);
        tcoValuesFilter.techconditionsobjects := ENTechConditionsObjectsRef.Create;
        tcoValuesFilter.techconditionsobjects.code := ENTCOValuesObj.techconditionsobjects.code;

        ENTCOValuesList := TempENTCOValues.getScrollableFilteredList(tcoValuesFilter,0,-1);
        tcoValLastCount:=High(ENTCOValuesList.list);

        //Пункт №1
        TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
        ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_1);
        if  ENTCOValuesObj.tcoValuesType = nil then
            ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
        ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
        edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;

        for i:=0 to tcoValLastCount do
        begin
              if ((ENTCOValuesList.list[i].tcoValuesTypeCode = WORK_WITH_CONNECTION_ITEM_1) or
              (ENTCOValuesList.list[i].tcoValuesTypeCode = WORK_WITH_CONNECTION_ITEM_2) or
              (ENTCOValuesList.list[i].tcoValuesTypeCode = WORK_WITH_CONNECTION_ITEM_3) or
              (ENTCOValuesList.list[i].tcoValuesTypeCode = WORK_WITH_CONNECTION_ITEM_4) or
              (ENTCOValuesList.list[i].tcoValuesTypeCode = WORK_WITH_CONNECTION_ITEM_5) or
              (ENTCOValuesList.list[i].tcoValuesTypeCode = WORK_WITH_CONNECTION_ITEM_6) or
              (ENTCOValuesList.list[i].tcoValuesTypeCode = WORK_WITH_CONNECTION_ITEM_7) or
              (ENTCOValuesList.list[i].tcoValuesTypeCode = WORK_WITH_CONNECTION_ITEM_8) or
              (ENTCOValuesList.list[i].tcoValuesTypeCode = WORK_WITH_CONNECTION_ITEM_9))  then
                 tcoValuesTypeCode := ENTCOValuesList.list[i].tcoValuesTypeCode
             else
                 tcoValuesTypeCode := 0;
        end;

            case tcoValuesTypeCode of
                WORK_WITH_CONNECTION_ITEM_1 :
                begin
                    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
                    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_2);
                    if  ENTCOValuesObj.tcoValuesType = nil then
                       ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
                    ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
                    edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;//Пункт №2
                end;
                WORK_WITH_CONNECTION_ITEM_2 :
                begin
                    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
                    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_3);
                    if  ENTCOValuesObj.tcoValuesType = nil then
                       ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
                    ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
                    edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;//Пункт №3
                end;
                WORK_WITH_CONNECTION_ITEM_3 :
                begin
                    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
                    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_4);
                    if  ENTCOValuesObj.tcoValuesType = nil then
                       ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
                    ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
                    edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;
                end;
                WORK_WITH_CONNECTION_ITEM_4 :
                begin
                    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
                    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_5);
                    if  ENTCOValuesObj.tcoValuesType = nil then
                       ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
                    ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
                    edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;
                end;
                WORK_WITH_CONNECTION_ITEM_5 :
                begin
                    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
                    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_6);
                    if  ENTCOValuesObj.tcoValuesType = nil then
                       ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
                    ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
                    edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;
                end;
                WORK_WITH_CONNECTION_ITEM_6 :
                begin
                    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
                    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_7);
                    if  ENTCOValuesObj.tcoValuesType = nil then
                       ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
                    ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
                    edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;
                end;
                WORK_WITH_CONNECTION_ITEM_7 :
                begin
                    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
                    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_8);
                    if  ENTCOValuesObj.tcoValuesType = nil then
                       ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
                    ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
                    edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;
                end;
                WORK_WITH_CONNECTION_ITEM_8 :
                begin
                    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
                    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_9);
                    if  ENTCOValuesObj.tcoValuesType = nil then
                       ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
                    ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
                    edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;;
                end;
                WORK_WITH_CONNECTION_ITEM_9 :
                begin
                    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
                    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(WORK_WITH_CONNECTION_ITEM_10);
                    if  ENTCOValuesObj.tcoValuesType = nil then
                       ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
                    ENTCOValuesObj.tcoValuesType.code := ENtcOValuesTypeObj.code;
                    edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;
                end;
            end;
    end;


  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
     DisableControls([edtCode]);
     edtCode.Text := IntToStr(ENTCOValuesObj.code);
     TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;

     ENTCOValuesTypeObj := TempENTCOValuesType.getObject(ENTCOValuesObj.tcoValuesType.code);
     edtTCOValuesTypeName.Text := ENtcOValuesTypeObj.name;
     MakeMultiline(edtDescription.Lines, ENTCOValuesObj.description);
  end;
end;



procedure TfrmENTCOValuesEdit.spbENTCOValuesTypeClick(Sender: TObject);
var
   frmENTCOValuesTypeShow : TfrmENTCOValuesTypeShow;
  TempENTCOValues: ENTCOValuesControllerSoapPort;
  i, tcoValLastCount: Integer;
  ENTCOValuesList: ENTCOValuesShortList;
  tcoValuesFilter : ENTCOValuesFilter;
begin
   frmENTCOValuesTypeShow:=TfrmENTCOValuesTypeShow.Create(Application,fmNormal);
   try
      with frmENTCOValuesTypeShow do begin

        if ShowModal = mrOk then
        begin
            try
               edtTCOValuesTypeName.Text := GetReturnValue(sgENTCOValuesType,1);
               if  ENTCOValuesObj.tcoValuesType = nil then
                ENTCOValuesObj.tcoValuesType := ENTCOValuesTypeRef.Create;
               ENTCOValuesObj.tcoValuesType.code := StrToInt(GetReturnValue(sgENTCOValuesType,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENTCOValuesTypeShow.Free;
   end;

    TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;

    tcoValuesFilter := ENTCOValuesFilter.Create;
    SetNullIntProps(tcoValuesFilter);
    SetNullXSProps(tcoValuesFilter);
    tcoValuesFilter.techconditionsobjects := ENTechConditionsObjectsRef.Create;
    tcoValuesFilter.techconditionsobjects.code := ENTCOValuesObj.techconditionsobjects.code;

    ENTCOValuesList := TempENTCOValues.getScrollableFilteredList(tcoValuesFilter,0,-1);
    tcoValLastCount:=High(ENTCOValuesList.list);

    for i:=0 to tcoValLastCount do
    begin
        if ENTCOValuesList.list[i].tcoValuesTypeCode = ENTCOValuesObj.tcoValuesType.code then
        begin
            Application.MessageBox(PChar('Цей пункт вже додано, додайте наступний пункт!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
            edtTCOValuesTypeName.Text := '';
            ENTCOValuesObj.tcoValuesType := nil;
            Exit;
        end;
    end;

end;

procedure TfrmENTCOValuesEdit.spbTCOValuesTypeClearClick(Sender: TObject);
begin
  inherited;
  ENTCOValuesObj.tcoValuesType := nil;
  edtTCOValuesTypeName.Text := '';
end;

procedure TfrmENTCOValuesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTCOValues: ENTCOValuesControllerSoapPort;
  i, tcoValLastCount: Integer;
  ENTCOValuesList: ENTCOValuesShortList;
  tcoValuesFilter : ENTCOValuesFilter;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDescription
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    if DialogState = dsInsert then
    begin
        TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;

        tcoValuesFilter := ENTCOValuesFilter.Create;
        SetNullIntProps(tcoValuesFilter);
        SetNullXSProps(tcoValuesFilter);
        tcoValuesFilter.techconditionsobjects := ENTechConditionsObjectsRef.Create;
        tcoValuesFilter.techconditionsobjects.code := ENTCOValuesObj.techconditionsobjects.code;

        ENTCOValuesList := TempENTCOValues.getScrollableFilteredList(tcoValuesFilter,0,-1);
        tcoValLastCount:=High(ENTCOValuesList.list);

        for i:=0 to tcoValLastCount do
        begin
            if ENTCOValuesList.list[i].tcoValuesTypeCode = ENTCOValuesObj.tcoValuesType.code then
            begin
                Application.MessageBox(PChar('Цей пункт вже додано, додайте наступний пункт!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
                edtTCOValuesTypeName.Text := '';
                ENTCOValuesObj.tcoValuesType := nil;
                Exit;
            end;
        end;
    end;

    TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;

     ENTCOValuesObj.description := TrimRight(edtDescription.Text);

    if DialogState = dsInsert then
    begin
      ENTCOValuesObj.code:=low(Integer);
      TempENTCOValues.add(ENTCOValuesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTCOValues.save(ENTCOValuesObj);
    end;
  end;
end;


end.