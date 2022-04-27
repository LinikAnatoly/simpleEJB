
unit ShowENBonusList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBonusListController, AdvObj ;


type
  TfrmENBonusListShow = class(TChildForm)
    ImageList1: TImageList;
    sgENBonusList: TAdvStringGrid;
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
    actApprove: TAction;
    actUnApprove: TAction;
    N5: TMenuItem;
    actApprove1: TMenuItem;
    actUnApprove1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    actPrintReportBonus: TAction;
    HTTPRIOENBonusList: THTTPRIO;
    ToolButton9: TToolButton;
    actExportDBF: TAction;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENBonusListTopLeftChanged(Sender: TObject);
procedure sgENBonusListDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actApprove1Click(Sender: TObject);
    procedure actUnApproveExecute(Sender: TObject);
    procedure actPrintReportBonusExecute(Sender: TObject);
    procedure actApproveExecute(Sender: TObject);
    procedure actExportDBFExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENBonusListObj: ENBonusList;
 // ENBonusListFilterObj: ENBonusListFilter;
  
  
implementation

uses Main, EditENBonusList, EditENBonusListFilter, ENConsts, DMReportsUnit,
  reportBonus;


{$R *.dfm}

var
  //frmENBonusListShow : TfrmENBonusListShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBonusListHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер відомості'
          ,'Місяць відомості'
          ,'Рік відомості'
          ,'Підрозділ'
          ,'Тип '
          ,'Статус'
          ,'Дата створення'
          ,'Створив користувач'
          ,'Дата зміни'
          ,'Змінив користувач'
        );
   

procedure TfrmENBonusListShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBonusListShow:=nil;
    inherited;
  end;


procedure TfrmENBonusListShow.FormShow(Sender: TObject);
var
  TempENBonusList: ENBonusListControllerSoapPort;
  i: Integer;
  ENBonusListList: ENBonusListShortList;
  begin
  SetGridHeaders(ENBonusListHeaders, sgENBonusList.ColumnHeaders);
  ColCount:=100;
  TempENBonusList :=  HTTPRIOENBonusList as ENBonusListControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBonusListFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBonusListFilter(FilterObject).orderBySQL := ' ENBONUSLIST.YEARGEN desc , ENBONUSLIST.MONTHGEN desc , FINWORKERKIND.NAME ';
  ENBonusListList := TempENBonusList.getScrollableFilteredList(ENBonusListFilter(FilterObject),0,-1);


  LastCount:=High(ENBonusListList.list);

  if LastCount > -1 then
     sgENBonusList.RowCount:=LastCount+2
  else
     sgENBonusList.RowCount:=2;

   with sgENBonusList do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBonusListList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBonusListList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBonusListList.list[i].numberGen;
        if ENBonusListList.list[i].monthGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := MonthesNames[ENBonusListList.list[i].monthGen]; // IntToStr(ENBonusListList.list[i].monthGen);

        if ENBonusListList.list[i].yearGen = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENBonusListList.list[i].yearGen);

        Cells[4,i+1] := ENBonusListList.list[i].departmentShortName;

        Cells[5,i+1] := ENBonusListList.list[i].kindRefName;

        Cells[6,i+1] := ENBonusListList.list[i].statusName;


        if ENBonusListList.list[i].dateAdd = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENBonusListList.list[i].dateAdd);

        Cells[8,i+1] := ENBonusListList.list[i].userAdd;

        if ENBonusListList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDateTimeWithDate2String(ENBonusListList.list[i].dateEdit);

        Cells[10,i+1] := ENBonusListList.list[i].userGen;

        LastRow:=i+1;
        sgENBonusList.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBonusList.Row:=1;
end;

procedure TfrmENBonusListShow.sgENBonusListTopLeftChanged(Sender: TObject);
var
  TempENBonusList: ENBonusListControllerSoapPort;
  i,CurrentRow: Integer;
  ENBonusListList: ENBonusListShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBonusList.TopRow + sgENBonusList.VisibleRowCount) = ColCount
  then
    begin
      TempENBonusList :=  HTTPRIOENBonusList as ENBonusListControllerSoapPort;
      CurrentRow:=sgENBonusList.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBonusListFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBonusListFilter(FilterObject).orderBySQL := ' ENBONUSLIST.YEARGEN desc , ENBONUSLIST.MONTHGEN desc , FINWORKERKIND.NAME ';
  ENBonusListList := TempENBonusList.getScrollableFilteredList(ENBonusListFilter(FilterObject),ColCount-1, 100);



  sgENBonusList.RowCount:=sgENBonusList.RowCount+100;
  LastCount:=High(ENBonusListList.list);
  with sgENBonusList do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBonusListList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBonusListList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBonusListList.list[i].numberGen;

        if ENBonusListList.list[i].monthGen = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] :=  MonthesNames[ENBonusListList.list[i].monthGen]; // IntToStr(ENBonusListList.list[i].monthGen);

        if ENBonusListList.list[i].yearGen = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENBonusListList.list[i].yearGen);

        Cells[4,i+CurrentRow] := ENBonusListList.list[i].departmentShortName;

        Cells[5,i+CurrentRow ] := ENBonusListList.list[i].kindRefName;

        Cells[6,i+CurrentRow ] := ENBonusListList.list[i].statusName;

        if ENBonusListList.list[i].dateAdd = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(ENBonusListList.list[i].dateAdd);

        Cells[8,i+CurrentRow] := ENBonusListList.list[i].userAdd;

        if ENBonusListList.list[i].dateEdit = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDateTimeWithDate2String(ENBonusListList.list[i].dateEdit);

        Cells[10,i+CurrentRow] := ENBonusListList.list[i].userGen;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBonusList.Row:=CurrentRow-5;
   sgENBonusList.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBonusListShow.sgENBonusListDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBonusList,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBonusListShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBonusList.RowCount-1 do
   for j:=0 to sgENBonusList.ColCount-1 do
     sgENBonusList.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBonusListShow.actViewExecute(Sender: TObject);
Var TempENBonusList: ENBonusListControllerSoapPort;
begin
 TempENBonusList := HTTPRIOENBonusList as ENBonusListControllerSoapPort;
   try
     ENBonusListObj := TempENBonusList.getObject(StrToInt(sgENBonusList.Cells[0,sgENBonusList.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBonusListEdit:=TfrmENBonusListEdit.Create(Application, dsView);

  try
    frmENBonusListEdit.ShowModal;
  finally
    frmENBonusListEdit.Free;
    frmENBonusListEdit:=nil;
  end;
end;

procedure TfrmENBonusListShow.actEditExecute(Sender: TObject);
Var TempENBonusList: ENBonusListControllerSoapPort;
begin
 TempENBonusList := HTTPRIOENBonusList as ENBonusListControllerSoapPort;
   try
     ENBonusListObj := TempENBonusList.getObject(StrToInt(sgENBonusList.Cells[0,sgENBonusList.Row]));

     if ENBonusListObj.status.code <> ENConsts.ENBONUSLIST_STATUS_DRAFT then
     begin
        Application.MessageBox(PChar('Відомість вже затверджена ...'),
                      PChar('Увага !'),MB_ICONWARNING );
        Exit;
    end;
     



   except
   on EConvertError do Exit;
  end;
  frmENBonusListEdit:=TfrmENBonusListEdit.Create(Application, dsEdit);
  try
    if frmENBonusListEdit.ShowModal= mrOk then
      begin
        //TempENBonusList.save(ENBonusListObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBonusListEdit.Free;
    frmENBonusListEdit:=nil;
  end;
end;

procedure TfrmENBonusListShow.actExportDBFExecute(Sender: TObject);
begin
    frmReportBonus := TfrmReportBonus.Create(Application, dsInsert);
    forExportDBF := 1;
    frmReportBonus.edtDepartment.Visible := false;
    frmReportBonus.lblEPRenName.Visible := false;
    frmReportBonus.spbEPRen.Visible := false;
	try
		frmReportBonus.ShowModal;
	finally
		frmReportBonus.Free;
 end;

end;

procedure TfrmENBonusListShow.actApprove1Click(Sender: TObject);
var
TempENbonuslist : ENBonusListControllerSoapPort;
ObjCode : Integer;
begin
    try
     ObjCode := StrToInt(sgENBonusList.Cells[0,sgENBonusList.Row]);
    except
     on EConvertError do Exit;
    end;

     TempENBonusList := HTTPRIOENBonusList as ENBonusListControllerSoapPort;

    if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити відомість ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENbonuslist.approve(ObjCode);
        UpdateGrid(Sender);
    end;

end;

procedure TfrmENBonusListShow.actApproveExecute(Sender: TObject);
var
TempENbonuslist : ENBonusListControllerSoapPort;
ObjCode : Integer;
begin
 TempENBonusList := HTTPRIOENBonusList as ENBonusListControllerSoapPort;
  try
     ObjCode := StrToInt(sgENBonusList.Cells[0,sgENBonusList.Row]);
    except
     on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити відомість ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENbonuslist.approve(ObjCode);
        UpdateGrid(Sender);
    end;

end;

procedure TfrmENBonusListShow.actDeleteExecute(Sender: TObject);
Var TempENBonusList: ENBonusListControllerSoapPort;
  ObjCode: Integer;
  bonListObj : ENBonusList;
begin
 TempENBonusList := HTTPRIOENBonusList as ENBonusListControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBonusList.Cells[0,sgENBonusList.Row]);
   except
   on EConvertError do Exit;
  end;

  bonListObj :=  TempENBonusList.getObject(ObjCode);
  if bonListObj.status.code <> ENConsts.ENBONUSLIST_STATUS_DRAFT then
     begin
        Application.MessageBox(PChar('Відомість вже затверджена ...'),
                      PChar('Увага !'),MB_ICONWARNING );
        Exit;
    end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Відомость нарахування премії для співробітників) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBonusList.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBonusListShow.actInsertExecute(Sender: TObject);
// Var TempENBonusList: ENBonusListControllerSoapPort; 
begin
  // TempENBonusList := HTTPRIOENBonusList as ENBonusListControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBonusListObj:=ENBonusList.Create;



  try
    frmENBonusListEdit:=TfrmENBonusListEdit.Create(Application, dsInsert);
    try
      if frmENBonusListEdit.ShowModal = mrOk then
      begin
        if ENBonusListObj<>nil then
            //TempENBonusList.add(ENBonusListObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBonusListEdit.Free;
      frmENBonusListEdit:=nil;
    end;
  finally
    ENBonusListObj.Free;
  end;
end;

procedure TfrmENBonusListShow.actUnApproveExecute(Sender: TObject);
var
TempENbonuslist : ENBonusListControllerSoapPort;
ObjCode : Integer;
begin
    try
     ObjCode := StrToInt(sgENBonusList.Cells[0,sgENBonusList.Row]);
    except
     on EConvertError do Exit;
    end;

     TempENBonusList := HTTPRIOENBonusList as ENBonusListControllerSoapPort;

    if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження відомісті ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENbonuslist.unapprove(ObjCode);
        UpdateGrid(Sender);
    end;

end;

procedure TfrmENBonusListShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBonusListShow.actFilterExecute(Sender: TObject);
begin
{frmENBonusListFilterEdit:=TfrmENBonusListFilterEdit.Create(Application, dsInsert);
  try
    ENBonusListFilterObj := ENBonusListFilter.Create;
    SetNullIntProps(ENBonusListFilterObj);
    SetNullXSProps(ENBonusListFilterObj);

    if frmENBonusListFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBonusListFilter.Create;
      FilterObject := ENBonusListFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBonusListFilterEdit.Free;
    frmENBonusListFilterEdit:=nil;
  end;}
end;

procedure TfrmENBonusListShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENBonusListShow.actPrintReportBonusExecute(Sender: TObject);
begin
    frmReportBonus := TfrmReportBonus.Create(Application, dsInsert);
    forExportDBF := 0;
	try
		frmReportBonus.ShowModal;
	finally
		frmReportBonus.Free;
 end;

end;

end.