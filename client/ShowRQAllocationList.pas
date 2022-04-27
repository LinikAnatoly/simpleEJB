
unit ShowRQAllocationList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQAllocationListController, AdvObj, ENConsts;


type
  TfrmRQAllocationListShow = class(TChildForm)  
  HTTPRIORQAllocationList: THTTPRIO;
    ImageList1: TImageList;
    sgRQAllocationList: TAdvStringGrid;
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
    actConfirm: TAction;
    actUnConfirm: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQAllocationListTopLeftChanged(Sender: TObject);
procedure sgRQAllocationListDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actConfirmExecute(Sender: TObject);
    procedure actUnConfirmExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // RQAllocationListObj: RQAllocationList;
 // RQAllocationListFilterObj: RQAllocationListFilter;
  
  
implementation

uses Main, EditRQAllocationList, EditRQAllocationListFilter;


{$R *.dfm}

var
  //frmRQAllocationListShow : TfrmRQAllocationListShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQAllocationListHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер'
          ,'Період заявки (місяць)'
          ,'Дата складання'
          ,'Сума (без ПДВ), грн.'
          ,'Тип відомості'
          ,'Вид відомості'
          ,'Стан'
          ,'Підрозділ'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQAllocationListShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQAllocationListShow:=nil;
    inherited;
  end;


procedure TfrmRQAllocationListShow.FormShow(Sender: TObject);
var
  TempRQAllocationList: RQAllocationListControllerSoapPort;
  i: Integer;
  RQAllocationListList: RQAllocationListShortList;
  begin
  SetGridHeaders(RQAllocationListHeaders, sgRQAllocationList.ColumnHeaders);
  ColCount:=100;
  TempRQAllocationList :=  HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListFilter(FilterObject).orderBySQL := 'RQALLOCATIONLIST.DATEGEN DESC';

  RQAllocationListList := TempRQAllocationList.getScrollableFilteredList(RQAllocationListFilter(FilterObject),0,ColCount);


  LastCount:=High(RQAllocationListList.list);

  if LastCount > -1 then
     sgRQAllocationList.RowCount:=LastCount+2
  else
     sgRQAllocationList.RowCount:=2;

   with sgRQAllocationList do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQAllocationListList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQAllocationListList.list[i].numberGen;
        if RQAllocationListList.list[i].listPeriod = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQAllocationListList.list[i].listPeriod);
        if RQAllocationListList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQAllocationListList.list[i].dateGen);
        if RQAllocationListList.list[i].sumGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := SeparateThousands(RQAllocationListList.list[i].sumGen.DecimalString);

        Alignments[4, i + 1] := taRightJustify;
        Colors[4, i + 1] := $0080FF80;
        Cells[5,i+1] := RQAllocationListList.list[i].typeRefName;
        Cells[6,i+1] := RQAllocationListList.list[i].formRefName;
        Cells[7,i+1] := RQAllocationListList.list[i].statusRefName;
        Cells[8,i+1] := RQAllocationListList.list[i].departmentRefShortName;
        Cells[9,i+1] := RQAllocationListList.list[i].userGen;
        if RQAllocationListList.list[i].dateEdit = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(RQAllocationListList.list[i].dateEdit);

        LastRow:=i+1;
        sgRQAllocationList.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQAllocationList.Row:=1;
end;


procedure TfrmRQAllocationListShow.PopupMenu1Popup(Sender: TObject);
var
  objCode : Integer;
  TempRQAllocationList : RQAllocationListControllerSoapPort;
  aList : RQAllocationList;
begin
  inherited;
  TempRQAllocationList := HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;
  try
    objCode := StrToInt(sgRQAllocationList.Cells[0,sgRQAllocationList.Row]);
  except
    on EConvertError do Exit;
  end;

  aList := TempRQAllocationList.getObject(objCode);
  if aList = nil then Exit;

  actConfirm.Enabled := (aList.statusRef.code = RQALLOCATIONLISTSTATUS_MATERIALS_RESERVED);
  actUnConfirm.Enabled := (aList.statusRef.code = RQALLOCATIONLISTSTATUS_CONFIRMED);

end;


procedure TfrmRQAllocationListShow.sgRQAllocationListTopLeftChanged(Sender: TObject);
var
  TempRQAllocationList: RQAllocationListControllerSoapPort;
  i,CurrentRow: Integer;
  RQAllocationListList: RQAllocationListShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQAllocationList.TopRow + sgRQAllocationList.VisibleRowCount) = ColCount
  then
    begin
      TempRQAllocationList :=  HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;
      CurrentRow:=sgRQAllocationList.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListFilter(FilterObject).orderBySQL := 'RQALLOCATIONLIST.DATEGEN DESC';


  RQAllocationListList := TempRQAllocationList.getScrollableFilteredList(RQAllocationListFilter(FilterObject),ColCount-1, 100);

  sgRQAllocationList.RowCount:=sgRQAllocationList.RowCount+100;
  LastCount:=High(RQAllocationListList.list);
  with sgRQAllocationList do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQAllocationListList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQAllocationListList.list[i].numberGen;
        if RQAllocationListList.list[i].listPeriod = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(RQAllocationListList.list[i].listPeriod);
        if RQAllocationListList.list[i].dateGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(RQAllocationListList.list[i].dateGen);
        if RQAllocationListList.list[i].sumGen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := SeparateThousands(RQAllocationListList.list[i].sumGen.DecimalString);

        Alignments[4, i + CurrentRow] := taRightJustify;
        Colors[4, i + CurrentRow] := $0080FF80;
        Cells[5,i+CurrentRow] := RQAllocationListList.list[i].typeRefName;
        Cells[6,i+CurrentRow] := RQAllocationListList.list[i].formRefName;
        Cells[7,i+CurrentRow] := RQAllocationListList.list[i].statusRefName;
        Cells[8,i+CurrentRow] := RQAllocationListList.list[i].departmentRefShortName;
        Cells[9,i+CurrentRow] := RQAllocationListList.list[i].userGen;
        if RQAllocationListList.list[i].dateEdit = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := XSDate2String(RQAllocationListList.list[i].dateEdit);

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQAllocationList.Row:=CurrentRow-5;
   sgRQAllocationList.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQAllocationListShow.sgRQAllocationListDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQAllocationList,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQAllocationListShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQAllocationList.RowCount-1 do
   for j:=0 to sgRQAllocationList.ColCount-1 do
     sgRQAllocationList.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQAllocationListShow.actViewExecute(Sender: TObject);
Var TempRQAllocationList: RQAllocationListControllerSoapPort;
begin
 TempRQAllocationList := HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;
   try
     RQAllocationListObj := TempRQAllocationList.getObject(StrToInt(sgRQAllocationList.Cells[0,sgRQAllocationList.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQAllocationListEdit:=TfrmRQAllocationListEdit.Create(Application, dsView);
  try
    frmRQAllocationListEdit.ShowModal;
  finally
    frmRQAllocationListEdit.Free;
    frmRQAllocationListEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListShow.actEditExecute(Sender: TObject);
var
  TempRQAllocationList: RQAllocationListControllerSoapPort;
begin
  TempRQAllocationList := HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;
  try
    RQAllocationListObj := TempRQAllocationList.getObject(StrToInt(sgRQAllocationList.Cells[0,sgRQAllocationList.Row]));
  except
    on EConvertError do Exit;
  end;

  if (RQAllocationListObj.statusRef.code = RQALLOCATIONLISTSTATUS_CONFIRMED) then
    frmRQAllocationListEdit := TfrmRQAllocationListEdit.Create(Application, dsView)
  else begin

    if (RQAllocationListObj.statusRef.code = RQALLOCATIONLISTSTATUS_MATERIALS_RESERVED) then begin
      TempRQAllocationList.editAllocationBudget();
    end;
    frmRQAllocationListEdit := TfrmRQAllocationListEdit.Create(Application, dsEdit);
	end;


  try
    if frmRQAllocationListEdit.ShowModal = mrOk then
      begin
        //TempRQAllocationList.save(RQAllocationListObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQAllocationListEdit.Free;
    frmRQAllocationListEdit:=nil;
  end;
end;


procedure TfrmRQAllocationListShow.actConfirmExecute(Sender: TObject);
var
  ObjCode : Integer;
  TempRQAllocationList : RQAllocationListControllerSoapPort;
begin
  inherited;
  TempRQAllocationList := HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;
  try
    ObjCode := StrToInt(sgRQAllocationList.Cells[0,sgRQAllocationList.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити відомість?'),
         PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQAllocationList.confirm(ObjCode);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmRQAllocationListShow.actDeleteExecute(Sender: TObject);
Var TempRQAllocationList: RQAllocationListControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQAllocationList := HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQAllocationList.Cells[0,sgRQAllocationList.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Відомість розподілу залишків) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQAllocationList.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQAllocationListShow.actInsertExecute(Sender: TObject);
// Var TempRQAllocationList: RQAllocationListControllerSoapPort; 
begin
  RQAllocationListObj:=RQAllocationList.Create;
  try
    frmRQAllocationListEdit:=TfrmRQAllocationListEdit.Create(Application, dsInsert);
    try
      if frmRQAllocationListEdit.ShowModal = mrOk then
      begin
        if RQAllocationListObj<>nil then
            //TempRQAllocationList.add(RQAllocationListObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQAllocationListEdit.Free;
      frmRQAllocationListEdit:=nil;
    end;
  finally
    RQAllocationListObj.Free;
  end;
end;

procedure TfrmRQAllocationListShow.actUnConfirmExecute(Sender: TObject);
var
  ObjCode : Integer;
  TempRQAllocationList : RQAllocationListControllerSoapPort;
begin
  inherited;
  TempRQAllocationList := HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;
  try
    ObjCode := StrToInt(sgRQAllocationList.Cells[0,sgRQAllocationList.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження відомості?'),
         PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQAllocationList.unConfirm(ObjCode);
    UpdateGrid(Sender);
  end;

end;

procedure TfrmRQAllocationListShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListShow.actFilterExecute(Sender: TObject);
begin
  frmRQAllocationListFilterEdit:=TfrmRQAllocationListFilterEdit.Create(Application, dsInsert);
  try
    RQAllocationListFilterObj := RQAllocationListFilter.Create;
    SetNullIntProps(RQAllocationListFilterObj);
    SetNullXSProps(RQAllocationListFilterObj);

    if frmRQAllocationListFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQAllocationListFilter.Create;
      FilterObject := RQAllocationListFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQAllocationListFilterEdit.Free;
    frmRQAllocationListFilterEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.