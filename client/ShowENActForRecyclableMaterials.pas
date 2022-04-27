unit ShowENActForRecyclableMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENActController, AdvObj ;


type
  TfrmENActForRecyclableMaterialsShow = class(TChildForm)
  HTTPRIOENAct: THTTPRIO;
    ImageList1: TImageList;
    sgENAct: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actFindRelatedAct: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    actExport: TAction;
    actExpAct2: TAction;
    N12: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENActTopLeftChanged(Sender: TObject);
procedure sgENActDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actFindRelatedActExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actExpAct2Execute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   planCode: Integer;
   planStateCode: Integer;
   planStateName: String;
   isFiltered : boolean;
   
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENActObj: ENAct;
 // ENActFilterObj: ENActFilter;
  
  
implementation

uses Main, EditENAct, EditENActFilter, ENElementController,
  ENActStatusController, ENConsts, DMReportsUnit, ENWorkOrderController,
  ENPlanWorkController, ENPlanWorkStateController,
  EditENActForRecyclableMaterialsAdd;


{$R *.dfm}

var
  //frmENActShow : TfrmENActShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата проведення акту'
          ,'Дата акту'
          ,'Код МОЛ / ФИО мола с фин.кол.'
          ,'Тип'
          ,'Статус'
          ,'пользователь, внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENActForRecyclableMaterialsShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENActForRecyclableMaterialsShow := nil;

  inherited;
end;


procedure TfrmENActForRecyclableMaterialsShow.FormShow(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  i: Integer;
  ENActList: ENActShortList;
begin
  SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  ColCount:=100;
  TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;

  if FilterObject = nil then
  begin
    FilterObject := ENActFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);

    ENActFilter(FilterObject).conditionSQL := ' statusrefcode <> 2 ';

    ENActFilter(FilterObject).element := ENElement.Create();
    ENActFilter(FilterObject).element.code := ENELEMENTCODE_RECYCLABLE_MATERIALS;
  end;

  if not isFiltered then
  begin
      isFiltered := true;
      actFilterExecute(Sender);
      exit;
  end;

  ENActList := TempENAct.getScrollableFilteredList(ENActFilter(FilterObject),0,ColCount);


  LastCount:=High(ENActList.list);

  if LastCount > -1 then
     sgENAct.RowCount:=LastCount+2
  else
     sgENAct.RowCount:=2;

   with sgENAct do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActList.list[i].numberGen;
        if ENActList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENActList.list[i].dateGen);

          if ENActList.list[i].dateAct = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENActList.list[i].dateAct);

        Cells[4,i+1] :=  ENActList.list[i].finMolCode + ' / ' +  ENActList.list[i].finMolName;

        Cells[5,i+1] := ENActList.list[i].actTypeRefName; //'';
        Cells[6, i+1] := ENActList.list[i].statusRefName;
        Cells[7, i+1] := ENActList.list[i].userGen;

        if ENActList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENActList.list[i].dateEdit);


{ как устканиться - вывести в ГРИД
        Cells[4,i+1] := ENActList.list[i].userGen;
        if ENActList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENActList.list[i].dateEdit);
}
        LastRow:=i+1;
        sgENAct.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAct.Row:=1;
end;

procedure TfrmENActForRecyclableMaterialsShow.sgENActTopLeftChanged(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  i,CurrentRow: Integer;
  ENActList: ENActShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAct.TopRow + sgENAct.VisibleRowCount) = ColCount
  then
    begin
      TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;
      CurrentRow:=sgENAct.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActList := TempENAct.getScrollableFilteredList(ENActFilter(FilterObject),ColCount-1, 100);



  sgENAct.RowCount:=sgENAct.RowCount+100;
  LastCount:=High(ENActList.list);
  with sgENAct do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActList.list[i].numberGen;
        if ENActList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENActList.list[i].dateGen);

          if ENActList.list[i].dateAct = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENActList.list[i].dateAct);

        Cells[4,i+CurrentRow] := ENActList.list[i].finMolCode + ' / ' +  ENActList.list[i].finMolName;

        Cells[5,i+CurrentRow] := ENActList.list[i].actTypeRefName; //'';
        Cells[6, i+CurrentRow] := ENActList.list[i].statusRefName;
        Cells[7, i+CurrentRow] := ENActList.list[i].userGen;


        if ENActList.list[i].dateEdit = nil then
          Cells[8, i+CurrentRow] := ''
        else
          Cells[8, i+CurrentRow] := XSDate2String(ENActList.list[i].dateEdit);


{      вывести юзера и дату редактирования

        Cells[4,i+CurrentRow] := ENActList.list[i].userGen;
        if ENActList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDate2String(ENActList.list[i].dateEdit);
}
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAct.Row:=CurrentRow-5;
   sgENAct.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActForRecyclableMaterialsShow.sgENActDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAct,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENActForRecyclableMaterialsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAct.RowCount-1 do
   for j:=0 to sgENAct.ColCount-1 do
     sgENAct.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENActForRecyclableMaterialsShow.actViewExecute(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
begin
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  frmENActEdit:=TfrmENActEdit.Create(Application, dsView);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0,sgENAct.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmENActEdit.ShowModal in [mrOk ,mrYes ] then
      begin
        //TempENAct.save(ENActObj);
        UpdateGrid(Sender);
      end;

  finally
    frmENActEdit.Free;
    frmENActEdit:=nil;
  end;
end;

procedure TfrmENActForRecyclableMaterialsShow.actEditExecute(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
//res :
begin
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  frmENActEdit:=TfrmENActEdit.Create(Application, dsEdit);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0,sgENAct.Row]));
    except
      on EConvertError do Exit;
    end;

    if (frmENActEdit.ENActObj <> nil) then
    begin
      if (frmENActEdit.ENActObj.statusRef.code = ENACT_REVERSED) then
      begin
        Application.MessageBox(PChar('Акт сторновано ... використовуйте перегляд ...!!!'), PChar('Внимание !'),MB_ICONWARNING);
        exit;
      end;
      if (frmENActEdit.ENActObj.statusRef.code <> ENACT_GOOD) then
      begin
        Application.MessageBox(PChar('Акт На підписанні або вже Проведений ... використовуйте перегляд ...!!!'), PChar('Внимание !'),MB_ICONWARNING);
        exit;
      end;
    end
    else
    begin
        Application.MessageBox(PChar('Акт НЕ знайдено ...'), PChar('Внимание !'),MB_ICONWARNING);
        exit;
    end;

    if frmENActEdit.ShowModal in [mrOk ,mrYes ] then
      begin
        //TempENAct.save(ENActObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActEdit.Free;
    frmENActEdit:=nil;
  end;
end;

procedure TfrmENActForRecyclableMaterialsShow.actDeleteExecute(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
  ObjCode: Integer;
  ENActObj : ENAct;
begin
 TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAct.Cells[0,sgENAct.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Акти виконаних робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      ENActObj := TempENAct.getObject(ObjCode);
      if (ENActObj <> nil) then
      begin
        if (ENActObj.statusRef.code <> ENACT_GOOD) then
        begin
          Application.MessageBox(PChar('Акт вже проведений ... !!!'), PChar('Внимание !'),MB_ICONWARNING);
          exit;
        end;
      end
      else
      begin
          Application.MessageBox(PChar('Акт НЕ знайдено ...'), PChar('Внимание !'),MB_ICONWARNING);
          exit;
      end;

      TempENAct.remove(ObjCode, 1);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActForRecyclableMaterialsShow.actInsertExecute(Sender: TObject);
begin
  ENActForRecyclableMaterialsObj := ENAct.Create;
  SetNullIntProps(ENActForRecyclableMaterialsObj);
  SetNullXSProps(ENActForRecyclableMaterialsObj);

  try
    frmENActForRecyclableMaterialsAdd := TfrmENActForRecyclableMaterialsAdd.Create(Application, dsInsert);
    try
      if frmENActForRecyclableMaterialsAdd.ShowModal = mrOk then
      begin
        if ENActForRecyclableMaterialsObj <> nil then
          UpdateGrid(Sender);
      end;
    finally
      frmENActForRecyclableMaterialsAdd.Free;
      frmENActForRecyclableMaterialsAdd := nil;
    end;
  finally
    frmENActForRecyclableMaterialsAdd.Free;
  end;
end;

procedure TfrmENActForRecyclableMaterialsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENActForRecyclableMaterialsShow.actFilterExecute(Sender: TObject);
begin
  frmENActFilterEdit := TfrmENActFilterEdit.Create(Application, dsInsert);
  try
    ENActFilterObj := ENActFilter.Create;
    SetNullIntProps(ENActFilterObj);
    SetNullXSProps(ENActFilterObj);

    ENActFilterObj.element := ENElement.Create();
    ENActFilterObj.element.code := ENELEMENTCODE_RECYCLABLE_MATERIALS;
    frmENActFilterEdit.edtENElementElementName.Text := 'АВТОМАТИЧНЕ переведення матеріалів до ВТОР. СИРОВИНИ';
    frmENActFilterEdit.DisableControls([frmENActFilterEdit.spbENElementElement]);

    if frmENActFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENActFilter.Create;

      if length(ENActFilterObj.conditionSQL)>0 then
        ENActFilterObj.conditionSQL :=ENActFilterObj.conditionSQL+ 'and enact.statusrefcode <> ' + IntToStr(ENACT_CANCELED)
      else ENActFilterObj.conditionSQL := ' enact.statusrefcode <> ' + IntToStr(ENACT_CANCELED);
      FilterObject := ENActFilterObj;

      actUpdateExecute(Sender);
    end;
  finally
    frmENActFilterEdit.Free;
    frmENActFilterEdit:=nil;
  end;
end;

procedure TfrmENActForRecyclableMaterialsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENActForRecyclableMaterialsShow.actFindRelatedActExecute(Sender: TObject);
var
 TempENAct: ENActControllerSoapPort;
 actList : ENActShortList;
 ObjCode, i : Integer;
 sql : string;
begin
  inherited;
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  try
     ObjCode := StrToInt(sgENAct.Cells[0,sgENAct.Row]);
  except
     on EConvertError do Exit;
  end;

  sql := '';
  actList := TempENAct.getActs4Recalc(ObjCode);

  for  i:=0 to actList.totalCount - 1 do
  begin
    if Length(sql) = 0 then
      sql := IntToStr(actList.list[i].code)
    else
    sql := sql + ', ' + IntToStr(actList.list[i].code);
  end;

  ENActFilterObj := ENActFilter.Create;
  SetNullIntProps(ENActFilterObj);
  SetNullXSProps(ENActFilterObj);
  ENActFilterObj.conditionSQL := ' enact.code in (' + sql + ')';

  FilterObject := ENActFilterObj;
  UpdateGrid(Sender);

end;

procedure TfrmENActForRecyclableMaterialsShow.actExportExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку ... '+#10#13+' Зберегти в Ексель ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    DMReports.exportGrid(sgENAct, 'Список_актов_');
  end;
end;

procedure TfrmENActForRecyclableMaterialsShow.actExpAct2Execute(Sender: TObject);
  var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 15);
  SetLength(args, 15);

  argNames[0] := 'condition';
  if Trim(ENActFilter(ENActFilterObj).conditionSQL) <> '' then
  args[0] := ' and ' +  ENActFilter(ENActFilterObj).conditionSQL
  else
  args[0] := '';

  argNames[1] := 'numbergen';
  if Trim(ENActFilter(ENActFilterObj).numberGen) <> '' then
  args[1] := ' and UPPER(ENACT.NUMBERGEN) like ' + 'UPPER(' + '''' + ToLIKE(ENActFilter(ENActFilterObj).numberGen) + '''' + ') '
  else
  args[1] := '';

  argNames[2] := 'comment';
  if Trim(ENActFilter(ENActFilterObj).commentGen) <> '' then
  args[2] := ' and UPPER(ENACT.COMMENTGEN) like ' + 'UPPER(' + '''' +  ToLIKE(ENActFilter(ENActFilterObj).commentGen) + '''' +  ') '
  else
  args[2] := '';

  argNames[3] := 'finmolcode';
  if Trim(ENActFilter(ENActFilterObj).finMolCode) <> '' then
  args[3] := ' and ENACT.FINMOLCODE like (' +  ToLIKE(ENActFilter(ENActFilterObj).finMolCode) + ') '
  else
  args[3] := '';

  argNames[4] := 'finmechaniccode';
  if Trim(ENActFilter(ENActFilterObj).finMechanicCode) <> '' then
  args[4] := ' and ENACT.FINMECHANICCODE like (' +  ToLIKE(ENActFilter(ENActFilterObj).finMechanicCode) + ') '
  else
  args[4] := '';

  argNames[5] := 'elementcode';
  if ENActFilterObj.element <> nil then
  args[5] := ' and ENACT.ELEMENTCODE =  ' +  IntToStr(ENActFilter(ENActFilterObj).element.code)
  else
  args[5] := '';


  argNames[6] := 'acttype';
  if ENActFilterObj.actTypeRef <> nil then
  args[6] := ' and ENACT.ACTTYPEREFCODE =  ' +  IntToStr(ENActFilter(ENActFilterObj).actTypeRef.code)
  else
  args[6] := '';



    argNames[7] := 'actstatus';
  if ENActFilterObj.statusRef <> nil then
  args[7] := ' and ENACT.STATUSREFCODE =  ' +  IntToStr(ENActFilter(ENActFilterObj).statusRef.code)
  else
  args[7] := '';
                      
  reportName := 'rep_execute_acts';
  makeReport(reportName, argNames, args, 'xls');

  //  Application.MessageBox(PChar('код акта ' +  IntToStr(codact) + '!!!'), PChar('Внимание !'),MB_ICONWARNING);


end;

end.
