
unit EditENPlanWorkItem2Graph;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkItem2GraphController,
  AdvObj, ExtCtrls ;

type
  TfrmENPlanWorkItem2GraphEdit = class(TDialogForm)


  HTTPRIOENPlanWorkItem2Graph: THTTPRIO;
    pnl1: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    sgENPlanWorkItem2Graph: TAdvStringGrid;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
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
    Button1: TButton;
    btnEdit: TButton;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    Label2: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Label3: TLabel;
    lblInfo: TLabel;
    btnCreatePlanwork: TButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUpdateExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure sgENPlanWorkItem2GraphDblClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure edtYearGenCloseUp(Sender: TObject);
    procedure edtMonthGenCloseUp(Sender: TObject);
    procedure sgENPlanWorkItem2GraphCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: string; var Valid: Boolean);
    procedure sgENPlanWorkItem2GraphSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: string);
    procedure sgENPlanWorkItem2GraphGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);

    procedure SetColumnFullWidth(Grid: TStringGrid; ACol: Integer);

    procedure SizeColsToHeaders(Grid:TStringGrid);
    procedure btnCreatePlanworkClick(Sender: TObject);
    procedure sgENPlanWorkItem2GraphCellChanging(Sender: TObject; OldRow,
      OldCol, NewRow, NewCol: Integer; var Allow: Boolean);


  private
    { Private declarations }
    StateEditSave : Integer;
  public
    { Public declarations }
    PLANWORKREFCODE : Integer;
    departmentCode : Integer;

end;

var
  frmENPlanWorkItem2GraphEdit: TfrmENPlanWorkItem2GraphEdit;
  ENPlanWorkItem2GraphObj: ENPlanWorkItem2Graph;

  ENPlanWorkItem2GraphHeaders28Day: array [1..35] of String =
        (  'ун. Код роботи'
          ,'Код роботи'
          ,'Найменування роботи'
          ,'Од.виміру'
          ,'Кількість'
          ,'Норма часу на од.'
          ,'Всього часу з коеф.'
          ,'д.1'
          ,'д.2'
          ,'д.3'
          ,'д.4'
          ,'д.5'
          ,'д.6'
          ,'д.7'
          ,'д.8'
          ,'д.9'
          ,'д.10'
          ,'д.11'
          ,'д.12'
          ,'д.13'
          ,'д.14'
          ,'д.15'
          ,'д.16'
          ,'д.17'
          ,'д.18'
          ,'д.19'
          ,'д.20'
          ,'д.21'
          ,'д.22'
          ,'д.23'
          ,'д.24'
          ,'д.25'
          ,'д.26'
          ,'д.27'
          ,'д.28'
        );

  ENPlanWorkItem2GraphHeaders29Day: array [1..36] of String =
        (  'ун. Код роботи'
          ,'Код роботи'
          ,'Найменування роботи'
          ,'Од.виміру'
          ,'Кількість'
          ,'Норма часу на од.'
          ,'Всього часу з коеф.'
          ,'д.1'
          ,'д.2'
          ,'д.3'
          ,'д.4'
          ,'д.5'
          ,'д.6'
          ,'д.7'
          ,'д.8'
          ,'д.9'
          ,'д.10'
          ,'д.11'
          ,'д.12'
          ,'д.13'
          ,'д.14'
          ,'д.15'
          ,'д.16'
          ,'д.17'
          ,'д.18'
          ,'д.19'
          ,'д.20'
          ,'д.21'
          ,'д.22'
          ,'д.23'
          ,'д.24'
          ,'д.25'
          ,'д.26'
          ,'д.27'
          ,'д.28'
          ,'д.29'
        );

  ENPlanWorkItem2GraphHeaders30Day: array [1..37] of String =
        (  'ун. Код роботи'
          ,'Код роботи'
          ,'Найменування роботи'
          ,'Од.виміру'
          ,'Кількість'
          ,'Норма часу на од.'
          ,'Всього часу з коеф.'
          ,'д.1'
          ,'д.2'
          ,'д.3'
          ,'д.4'
          ,'д.5'
          ,'д.6'
          ,'д.7'
          ,'д.8'
          ,'д.9'
          ,'д.10'
          ,'д.11'
          ,'д.12'
          ,'д.13'
          ,'д.14'
          ,'д.15'
          ,'д.16'
          ,'д.17'
          ,'д.18'
          ,'д.19'
          ,'д.20'
          ,'д.21'
          ,'д.22'
          ,'д.23'
          ,'д.24'
          ,'д.25'
          ,'д.26'
          ,'д.27'
          ,'д.28'
          ,'д.29'
          ,'д.30'
        );

  ENPlanWorkItem2GraphHeaders31Day: array [1..38] of String =
        (  'ун. Код роботи'
          ,'Код роботи'
          ,'Найменування роботи'
          ,'Од.виміру'
          ,'Кількість'
          ,'Норма часу на од.'
          ,'Всього часу з коеф.'
          ,'д.1'
          ,'д.2'
          ,'д.3'
          ,'д.4'
          ,'д.5'
          ,'д.6'
          ,'д.7'
          ,'д.8'
          ,'д.9'
          ,'д.10'
          ,'д.11'
          ,'д.12'
          ,'д.13'
          ,'д.14'
          ,'д.15'
          ,'д.16'
          ,'д.17'
          ,'д.18'
          ,'д.19'
          ,'д.20'
          ,'д.21'
          ,'д.22'
          ,'д.23'
          ,'д.24'
          ,'д.25'
          ,'д.26'
          ,'д.27'
          ,'д.28'
          ,'д.29'
          ,'д.30'
          ,'д.31'
        );

implementation

uses ENPlanWorkController, ENConsts, EditMakePlanworkByGraph;


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkItem2GraphController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkItem2GraphEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      {edtDayWork
      ,edtUserGen
      ,edtDateEdit}
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      {edtCode.Text := IntToStr(ENPlanWorkItem2GraphObj.code);
      SetDateFieldForDateTimePicker(edtDayWork, ENPlanWorkItem2GraphObj.dayWork);
      edtUserGen.Text := ENPlanWorkItem2GraphObj.userGen;
      SetDateFieldForDateTimePicker(edtDateEdit, ENPlanWorkItem2GraphObj.dateEdit);
      }


  end;

         DialogState := dsView;
         btnEdit.Caption := 'Редагувати';
         sgENPlanWorkItem2Graph.Options :=  sgENPlanWorkItem2Graph.Options - [goEditing];

          frmENPlanWorkItem2GraphEdit.edtYearGen.Enabled := True;
          frmENPlanWorkItem2GraphEdit.edtMonthGen.Enabled := True;

          TEdit(frmENPlanWorkItem2GraphEdit.edtYearGen).ReadOnly:=true;
          DisableControls([frmENPlanWorkItem2GraphEdit.edtYearGen] , false);

          TEdit(frmENPlanWorkItem2GraphEdit.edtMonthGen).ReadOnly:=true;
          DisableControls([frmENPlanWorkItem2GraphEdit.edtMonthGen] , false);

          actUpdateExecute(Sender);

end;



procedure TfrmENPlanWorkItem2GraphEdit.sgENPlanWorkItem2GraphCellChanging(
  Sender: TObject; OldRow, OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
var
  CurrCellColor: TColor;
  curCellValue : Double;
begin
  { inherited;
   if ((OldCol < 7) or (DialogState <> dsEdit)) then
   begin
    Valid := False;
    Value := sgENPlanWorkItem2Graph.Cells[ACol, ARow];
    Exit;
   end;

   try
      curCellValue :=  StrToFloat(sgENPlanWorkItem2Graph.Cells[ACol, ARow]);
    except
      on EConvertError do
           begin
            curCellValue := 0;
            Valid := False;
            Value := sgENPlanWorkItem2Graph.Cells[ACol, ARow];
            Exit;
           end;
    end;

   if curCellValue > 0 then
    sgENPlanWorkItem2Graph.colors[ACol, ARow] := clAqua
    else
    sgENPlanWorkItem2Graph.colors[ACol, ARow] := clNone; }



end;

procedure TfrmENPlanWorkItem2GraphEdit.sgENPlanWorkItem2GraphCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: string; var Valid: Boolean);
var
  CurrCellColor: TColor;
  curCellValue : Double;
begin
 inherited;
   if ((ACol < 7) or (DialogState <> dsEdit)) then
   begin
    Valid := False;
    Value := sgENPlanWorkItem2Graph.Cells[ACol, ARow];
    Exit;
   end;

  if trim(sgENPlanWorkItem2Graph.Cells[ACol, ARow]) = '' then
   begin
      curCellValue := 0;
      Valid := true;
      Value := '';
      sgENPlanWorkItem2Graph.colors[ACol, ARow] := clNone;
      exit;
    end;

   try
      curCellValue :=  StrToFloat(sgENPlanWorkItem2Graph.Cells[ACol, ARow]);
    except
     // on EConvertError do
          begin
            curCellValue := 0;
            Valid := False;
            Value := '';
            sgENPlanWorkItem2Graph.colors[ACol, ARow] := clNone;
            exit;
          end;
    end;

    if (Value = '') then
      begin
        curCellValue := 0;
        sgENPlanWorkItem2Graph.colors[ACol, ARow] := clNone;
      end;


   if curCellValue > 0 then
    sgENPlanWorkItem2Graph.colors[ACol, ARow] := clAqua
    else
    sgENPlanWorkItem2Graph.colors[ACol, ARow] := clNone;


end;

procedure TfrmENPlanWorkItem2GraphEdit.sgENPlanWorkItem2GraphDblClickCell(
  Sender: TObject; ARow, ACol: Integer);
var
CurrCellColor: TColor;
begin
// if ((ACol>= 7) and (DialogState = dsEdit)) then
// begin
//    if sgENPlanWorkItem2Graph.colors[ACol, ARow]  = clAqua then
//    sgENPlanWorkItem2Graph.colors[ACol, ARow] := clNone
//    else
//    sgENPlanWorkItem2Graph.colors[ACol, ARow] := clAqua;
// end;
end;

procedure TfrmENPlanWorkItem2GraphEdit.sgENPlanWorkItem2GraphGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  if (ACol >= 7) then
  begin
    AEditor := edFloat;
    sgENPlanWorkItem2Graph.SpinEdit.Precision := 3;
    sgENPlanWorkItem2Graph.SpinEdit.MinFloatValue := 0.000;
    sgENPlanWorkItem2Graph.SpinEdit.IncrementFloat := 0.001;
  end;
end;

procedure TfrmENPlanWorkItem2GraphEdit.sgENPlanWorkItem2GraphSetEditText(
  Sender: TObject; ACol, ARow: Integer; const Value: string);
begin
//  inherited;
//       if ((ACol < 7) or (DialogState = dsEdit)) then
//   begin
//    Exit;
//   end;

end;

procedure TfrmENPlanWorkItem2GraphEdit.actEditExecute(Sender: TObject);
begin
  inherited;
    //sgENPlanWorkItem2Graph.Options :=  sgENPlanWorkItem2Graph.Options + [goEditing];
end;

procedure TfrmENPlanWorkItem2GraphEdit.SetColumnFullWidth(Grid: TStringGrid; ACol: Integer);
var
  I: Integer;
  FixedWidth: Integer;
begin
  with Grid do
    if ACol >= FixedCols then
    begin
      FixedWidth := 0;
      for I := 0 to FixedCols - 1 do
        Inc(FixedWidth, ColWidths[I] + GridLineWidth);
      ColWidths[ACol] := ClientWidth - FixedWidth - GridLineWidth;
    end;
end;



procedure TfrmENPlanWorkItem2GraphEdit.actUpdateExecute(Sender: TObject);
var
  TempENPlanWorkItem2Graph: ENPlanWorkItem2GraphControllerSoapPort;
  LastCount  , i , LastRow , ColCount , selectedRow , jj  : Integer;
  ENPlanWorkItem2GraphList: ENPlanWorkItem2GraphShortList;
  graphFilter : ENPlanWorkItem2GraphFilter;
  countWorkbyGraph : Double;
begin
  inherited;
  selectedRow := 1;
  sgENPlanWorkItem2Graph.Options :=  sgENPlanWorkItem2Graph.Options - [goColMoving];

   ColCount:=100;
   countWorkbyGraph := 0;

     TempENPlanWorkItem2Graph :=  HTTPRIOENPlanWorkItem2Graph as ENPlanWorkItem2GraphControllerSoapPort;

     graphFilter := ENPlanWorkItem2GraphFilter.Create;
     SetNullIntProps(graphFilter);
     SetNullXSProps(graphFilter);

     graphFilter.planWorkRef:= ENPlanWorkRef.Create;
     graphFilter.planWorkRef.code := ENPlanWorkItem2GraphObj.planWorkRef.code;


     if (edtMonthGen.ItemIndex >= 0) then
       graphFilter.month := edtMonthGen.ItemIndex + 1
     else
       graphFilter.month := Low(Integer) ;

     if (edtYearGen.ItemIndex >= 0) then
       graphFilter.year := edtYearGen.ItemIndex + 2009
     else
       graphFilter.year := Low(Integer) ;


     ENPlanWorkItem2GraphList := TempENPlanWorkItem2Graph.getScrollableFilteredListGraph({ENPlanWorkItem2GraphFilter(FilterObject)} graphFilter );
     LastCount:=High(ENPlanWorkItem2GraphList.list);

     if LastCount < 0  then
     Exit;

      sgENPlanWorkItem2Graph.ColCount:= 40;
     ClearGrid(sgENPlanWorkItem2Graph);
     if ENPlanWorkItem2GraphList.list[0].lastdayinmonth = 28 then
     begin
       sgENPlanWorkItem2Graph.ColCount := 35;
       SetGridHeaders(ENPlanWorkItem2GraphHeaders28Day, sgENPlanWorkItem2Graph.ColumnHeaders);
     end;
      if ENPlanWorkItem2GraphList.list[0].lastdayinmonth = 29 then
     begin
       sgENPlanWorkItem2Graph.ColCount := 36;
       SetGridHeaders(ENPlanWorkItem2GraphHeaders29Day, sgENPlanWorkItem2Graph.ColumnHeaders);
     end;

     if ENPlanWorkItem2GraphList.list[0].lastdayinmonth = 30 then
     begin
       sgENPlanWorkItem2Graph.ColCount := 37;
       SetGridHeaders(ENPlanWorkItem2GraphHeaders30Day, sgENPlanWorkItem2Graph.ColumnHeaders);
     end;

     if ENPlanWorkItem2GraphList.list[0].lastdayinmonth = 31 then
     begin
       sgENPlanWorkItem2Graph.ColCount := 38;
       SetGridHeaders(ENPlanWorkItem2GraphHeaders31Day, sgENPlanWorkItem2Graph.ColumnHeaders);
     end;

      for jj:=0 to sgENPlanWorkItem2Graph.ColCount-1 do
             if jj > 6 then
              sgENPlanWorkItem2Graph.ColWidths[jj] := 35;






     if LastCount > -1 then
     sgENPlanWorkItem2Graph.RowCount:=LastCount+2
    else
     sgENPlanWorkItem2Graph.RowCount:=2;

   with sgENPlanWorkItem2Graph do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if i= 0 then lblInfo.Caption:= ENPlanWorkItem2GraphList.list[i].periodenplanwork;


        if ENPlanWorkItem2GraphList.list[i].planWorkItemRefCode <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkItem2GraphList.list[i].planWorkItemRefCode)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENPlanWorkItem2GraphList.list[i].techkartNumber;
        Cells[2,i+1] := ENPlanWorkItem2GraphList.list[i].tkTechcardName;
        Cells[3,i+1] := ENPlanWorkItem2GraphList.list[i].tkMeasurementName;



        if ENPlanWorkItem2GraphList.list[i].planWorkItemRefCountGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENPlanWorkItem2GraphList.list[i].planWorkItemRefCountGen.DecimalString;

        if ENPlanWorkItem2GraphList.list[i].tktechcardnormoftime = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENPlanWorkItem2GraphList.list[i].tktechcardnormoftime.DecimalString;

       if ENPlanWorkItem2GraphList.list[i].planWorkItemRefTimeGen = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENPlanWorkItem2GraphList.list[i].planWorkItemRefTimeGen.DecimalString;



        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d1) > 0  then
        Cells[7,i+1] := 'X';
       if StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d1 , 'X', '', [rfReplaceAll])) > 0
        then
         begin
         countWorkbyGraph := StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d1 , 'X', '', [rfReplaceAll]));
         Colors[7,i+1] := clAqua;
         Cells[7,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d1 , 'X', '', [rfReplaceAll]);
        end;

         if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d2) > 0  then
        Cells[8,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d2 , 'X', '', [rfReplaceAll])) > 0   then
        begin
         countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d2 , 'X', '', [rfReplaceAll]));
         Colors[8,i+1] := clAqua;
         Cells[8,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d2 , 'X', '', [rfReplaceAll]);

        end;

         if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d3) > 0  then
        Cells[9,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d3 , 'X', '', [rfReplaceAll])) > 0   then
        begin
         countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d3 , 'X', '', [rfReplaceAll]));
         Colors[9,i+1] := clAqua;
         Cells[9,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d3 , 'X', '', [rfReplaceAll]);

        end;

         if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d4) > 0  then
        Cells[10,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d4 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d4 , 'X', '', [rfReplaceAll]));
         Colors[10,i+1] := clAqua;
         Cells[10,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d4 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d5) > 0  then
        Cells[11,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d5 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d5 , 'X', '', [rfReplaceAll]));
         Colors[11,i+1] := clAqua;
         Cells[11,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d5 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d6) > 0  then
        Cells[12,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d6 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d6 , 'X', '', [rfReplaceAll]));
         Colors[12,i+1] := clAqua;
         Cells[12,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d6 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d7) > 0  then
        Cells[13,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d7 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d7 , 'X', '', [rfReplaceAll]));
         Colors[13,i+1] := clAqua;
         Cells[13,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d7 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d8) > 0  then
        Cells[14,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d8 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d8 , 'X', '', [rfReplaceAll]));
         Colors[14,i+1] := clAqua;
         Cells[14,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d8 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d9) > 0  then
        Cells[15,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d9 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d9 , 'X', '', [rfReplaceAll]));
         Colors[15,i+1] := clAqua;
         Cells[15,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d9 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d10) > 0  then
        Cells[16,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d10 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d10 , 'X', '', [rfReplaceAll]));
         Colors[16,i+1] := clAqua;
         Cells[16,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d10 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d11) > 0  then
        Cells[17,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d11 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d11 , 'X', '', [rfReplaceAll]));
         Colors[17,i+1] := clAqua;
         Cells[17,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d11 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d12) > 0  then
        Cells[18,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d12 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d12 , 'X', '', [rfReplaceAll]));
         Colors[18,i+1] := clAqua;
         Cells[18,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d12 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d13) > 0  then
        Cells[19,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d13 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d13 , 'X', '', [rfReplaceAll]));
         Colors[19,i+1] := clAqua;
         Cells[19,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d13 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d14) > 0  then
        Cells[20,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d14 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d14 , 'X', '', [rfReplaceAll]));
         Colors[20,i+1] := clAqua;
         Cells[20,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d14 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d15) > 0  then
        Cells[21,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d15 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d15 , 'X', '', [rfReplaceAll]));
         Colors[21,i+1] := clAqua;
         Cells[21,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d15 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d16) > 0  then
        Cells[22,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d16 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d16 , 'X', '', [rfReplaceAll]));
         Colors[22,i+1] := clAqua;
         Cells[22,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d16 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d17) > 0  then
        Cells[23,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d17 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d17 , 'X', '', [rfReplaceAll]));
         Colors[23,i+1] := clAqua;
         Cells[23,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d17 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d18) > 0  then
        Cells[24,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d18 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d18 , 'X', '', [rfReplaceAll]));
         Colors[24,i+1] := clAqua;
         Cells[24,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d18 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d19) > 0  then
        Cells[25,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d19 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d19 , 'X', '', [rfReplaceAll]));
         Colors[25,i+1] := clAqua;
         Cells[25,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d19 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d20) > 0  then
        Cells[26,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d20 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d20 , 'X', '', [rfReplaceAll]));
         Colors[26,i+1] := clAqua;
         Cells[26,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d20 , 'X', '', [rfReplaceAll]);
        end;


        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d21) > 0  then
        Cells[27,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d21 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d21 , 'X', '', [rfReplaceAll]));
         Colors[27,i+1] := clAqua;
         Cells[27,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d21 , 'X', '', [rfReplaceAll]);
        end;


        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d22) > 0  then
        Cells[28,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d22 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d22 , 'X', '', [rfReplaceAll]));
         Colors[28,i+1] := clAqua;
         Cells[28,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d22 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d23) > 0  then
        Cells[29,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d23 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d23 , 'X', '', [rfReplaceAll]));
         Colors[29,i+1] := clAqua;
         Cells[29,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d23 , 'X', '', [rfReplaceAll]);
        end;


        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d24) > 0  then
        Cells[30,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d24 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d24 , 'X', '', [rfReplaceAll]));
         Colors[30,i+1] := clAqua;
         Cells[30,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d24 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d25) > 0  then
        Cells[31,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d25 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d25 , 'X', '', [rfReplaceAll]));
         Colors[31,i+1] := clAqua;
         Cells[31,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d25 , 'X', '', [rfReplaceAll]);
        end;


        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d26) > 0  then
        Cells[32,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d26 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d26 , 'X', '', [rfReplaceAll]));
         Colors[32,i+1] := clAqua;
         Cells[32,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d26 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d27) > 0  then
        Cells[33,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d27 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d27 , 'X', '', [rfReplaceAll]));
         Colors[33,i+1] := clAqua;
         Cells[33,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d27 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d28) > 0  then
        Cells[34,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d28 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d28 , 'X', '', [rfReplaceAll]));
         Colors[34,i+1] := clAqua;
         Cells[34,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d28 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d29) > 0  then
        Cells[35,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d29 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d29 , 'X', '', [rfReplaceAll]));
         Colors[35,i+1] := clAqua;
         Cells[35,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d29 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d30) > 0  then
        Cells[36,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d30 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d30 , 'X', '', [rfReplaceAll]));
         Colors[36,i+1] := clAqua;
         Cells[36,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d30 , 'X', '', [rfReplaceAll]);
        end;

        if Pos( 'X'  , ENPlanWorkItem2GraphList.list[i].d31) > 0  then
        Cells[37,i+1] := 'X';
        if StrToFloat( StringReplace(ENPlanWorkItem2GraphList.list[i].d31 , 'X', '', [rfReplaceAll])) > 0   then
        begin
        countWorkbyGraph :=  countWorkbyGraph + StrToFloat(  StringReplace(ENPlanWorkItem2GraphList.list[i].d31 , 'X', '', [rfReplaceAll]));
         Colors[37,i+1] := clAqua;
         Cells[37,i+1] := StringReplace(ENPlanWorkItem2GraphList.list[i].d31 , 'X', '', [rfReplaceAll]);
        end;


        LastRow:=i+1;
        sgENPlanWorkItem2Graph.RowCount:=LastRow+1;
      end;

   // ColCount:=ColCount+1;
    sgENPlanWorkItem2Graph.Row:=1;

    if (countWorkbyGraph > 0 )  then
        HideControls( [btnCreatePlanwork] ,false)
      else
        HideControls(  [btnCreatePlanwork] ,true);

    if selectedRow <> 0 then
    begin
    if sgENPlanWorkItem2Graph.RowCount > selectedRow then
      sgENPlanWorkItem2Graph.Row := selectedRow
    else
      sgENPlanWorkItem2Graph.Row := sgENPlanWorkItem2Graph.RowCount - 1;
    end
    else
      sgENPlanWorkItem2Graph.Row:=1;

      // SizeColsToHeaders(sgENPlanWorkItem2Graph);


end;

procedure TfrmENPlanWorkItem2GraphEdit.btnCreatePlanworkClick(Sender: TObject);
var
 TempENPlanWorkItem2Graph: ENPlanWorkItem2GraphControllerSoapPort;
begin
  inherited;
      frmMakePlanworkByGraph := TfrmMakePlanworkByGraph.Create(Application, dsView);
      frmMakePlanworkByGraph.planCode := ENPlanWorkItem2GraphObj.planWorkRef.code;
      frmMakePlanworkByGraph.departmentCode := departmentCode;

      try
        if frmMakePlanworkByGraph.ShowModal = mrOk then
        begin
              TempENPlanWorkItem2Graph :=  HTTPRIOENPlanWorkItem2Graph as ENPlanWorkItem2GraphControllerSoapPort;

              TempENPlanWorkItem2Graph.closePlanWorkWithParamsOnGraph(ENPlanWorkItem2GraphObj.planWorkRef.code,
              frmMakePlanworkByGraph.masterCode,
              frmMakePlanworkByGraph.masterName,
              frmMakePlanworkByGraph.mechanicCode,
              frmMakePlanworkByGraph.mechanicName);

          //  TempENPlanWorkItem2Graph.EditENPlanWorkItem2Graph(pi2prArr);


         //   masterCode, masterName, mechanicCode, mechanicName,


           Application.MessageBox(PChar('Завдання-план створено!'), PChar('Повідомлення'), MB_ICONINFORMATION);

        end;

      finally
        frmMakePlanworkByGraph.Free;
        frmMakePlanworkByGraph := nil;
      end;
end;

procedure TfrmENPlanWorkItem2GraphEdit.btnEditClick(Sender: TObject);
var
 j , i  , pi2grArrCount : Integer;
 pi2grList : ENPlanWorkItem2GraphShortList; //  ENEstimateItemShortList;
 pi2prObj : ENPlanWorkItem2GraphShort; //ENEstimateItemShort;
 pi2prArr : ArrayOfENPlanWorkItem2GraphShort; //ArrayOfENEstimateItemShort;

 TempENPlanWorkItem2Graph: ENPlanWorkItem2GraphControllerSoapPort;
begin
  inherited;
       if DialogState = dsView then
        begin
          DialogState := dsEdit;
          btnEdit.Caption := 'Зберегти';
          sgENPlanWorkItem2Graph.Options :=  sgENPlanWorkItem2Graph.Options + [goEditing];
          hidecontrols([btnCreatePlanwork] , true);
        end
        else
        if DialogState = dsEdit then
        begin

         // сохранение данных графика

            pi2grList := ENPlanWorkItem2GraphShortList.Create;
            pi2grList.totalCount := 0;

               for i:=1 to sgENPlanWorkItem2Graph.RowCount-1 do
                 for j:=0 to sgENPlanWorkItem2Graph.ColCount-1 do
                 if j > 6  then
                 begin
                             if sgENPlanWorkItem2Graph.colors[j, i]  = clAqua then
                                    begin
                                       pi2prObj := ENPlanWorkItem2GraphShort.Create;
                                       SetNullIntProps(pi2prObj);
                                       SetNullXSProps(pi2prObj);
                                       pi2prObj.planWorkItemRefCode := StrToInt(sgENPlanWorkItem2Graph.Cells[0,i]) ;
                                       pi2prObj.planWorkRefCode :=  ENPlanWorkItem2GraphObj.planWorkRef.code;

                                       pi2prObj.countgen := TXSDecimal.Create;

                                       try
                                        pi2prObj.countgen.DecimalString :=  StringReplace(sgENPlanWorkItem2Graph.Cells[j, i] , 'X', '', [rfReplaceAll]);
                                       except
                                        on EConvertError do
                                         begin
                                           ShowMessage(sgENPlanWorkItem2Graph.Cells[j, i]  + ' j=' + inttostr(j)  + ' i = ' +  IntToStr(i) );
                                         end;
                                       end;

                                       pi2prObj.dayWork := TXSDateTime.Create;
                                       pi2prObj.dayWork.XSToNative(
                                                                   GetXSDateTime(
                                                                                 StrToDate(
                                                                                             IntToStr((j-6)) + '.' + IntToStr(edtMonthGen.ItemIndex+1) +'.' + edtYearGen.Text
                                                                                           )
                                                                                 )
                                                                    );



                                       pi2grArrCount := High(pi2prArr) + 1;
                                       SetLength(pi2prArr, pi2grArrCount + 1);
                                       pi2prArr[pi2grArrCount] := pi2prObj;

                                    end;
                             end;
                             pi2grList.list:= pi2prArr;
                             pi2grList.totalCount := High(pi2prArr) + 1;

          if (pi2grList.totalCount >= 0  ) then
          begin
            TempENPlanWorkItem2Graph :=  HTTPRIOENPlanWorkItem2Graph as ENPlanWorkItem2GraphControllerSoapPort;

            if pi2grList.totalCount = 0 then
            begin
                 pi2prObj := ENPlanWorkItem2GraphShort.Create;
                 SetNullIntProps(pi2prObj);
                 SetNullXSProps(pi2prObj);
                 pi2prObj.planWorkItemRefCode := LOW_INT;
                 pi2prObj.planWorkRefCode :=  ENPlanWorkItem2GraphObj.planWorkRef.code;
                 pi2prObj.countgen := TXSDecimal.Create;
                 pi2prObj.countgen.DecimalString := '0';

                 pi2prObj.dayWork := TXSDateTime.Create;
                 pi2prObj.dayWork.XSToNative(
                                             GetXSDateTime(
                                                           StrToDate(
                                                                       IntToStr((1)) + '.' + IntToStr(edtMonthGen.ItemIndex+1) +'.' + edtYearGen.Text
                                                                     )
                                                           )
                                              );



                 pi2grArrCount := High(pi2prArr) + 1;
                 SetLength(pi2prArr, pi2grArrCount + 1);
                 pi2prArr[pi2grArrCount] := pi2prObj;
                 pi2grList.list:= pi2prArr;
                 pi2grList.totalCount := 1;

                 TempENPlanWorkItem2Graph.EditENPlanWorkItem2Graph(pi2prArr);
            end
            else
            TempENPlanWorkItem2Graph.EditENPlanWorkItem2Graph(pi2prArr);
            
          end;


         DialogState := dsView;
         btnEdit.Caption := 'Редагувати';
         sgENPlanWorkItem2Graph.Options :=  sgENPlanWorkItem2Graph.Options - [goEditing];

         actUpdateExecute(Sender);
         hidecontrols([btnCreatePlanwork] , false) ;

         end;

          TEdit(frmENPlanWorkItem2GraphEdit.edtYearGen).ReadOnly:=true;
          DisableControls([frmENPlanWorkItem2GraphEdit.edtYearGen] , false);

          TEdit(frmENPlanWorkItem2GraphEdit.edtMonthGen).ReadOnly:=true;
          DisableControls([frmENPlanWorkItem2GraphEdit.edtMonthGen] , false);
 end;




procedure TfrmENPlanWorkItem2GraphEdit.edtMonthGenCloseUp(Sender: TObject);
begin
 //inherited;
    actUpdateExecute(Sender);
end;

procedure TfrmENPlanWorkItem2GraphEdit.edtYearGenCloseUp(Sender: TObject);
begin
  // inherited;
     actUpdateExecute(Sender);
end;

procedure TfrmENPlanWorkItem2GraphEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkItem2Graph: ENPlanWorkItem2GraphControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      {edtUserGen}
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    {TempENPlanWorkItem2Graph := HTTPRIOENPlanWorkItem2Graph as ENPlanWorkItem2GraphControllerSoapPort;


     ENPlanWorkItem2GraphObj.dayWork := GetTXSDateTimeFromTDateTimePicker(edtdayWork);	   

     ENPlanWorkItem2GraphObj.userGen := edtUserGen.Text; 

     ENPlanWorkItem2GraphObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtdateEdit);	   

    if DialogState = dsInsert then
    begin
      ENPlanWorkItem2GraphObj.code:=low(Integer);
      TempENPlanWorkItem2Graph.add(ENPlanWorkItem2GraphObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkItem2Graph.save(ENPlanWorkItem2GraphObj);
    end; }
  end;
end;

procedure TfrmENPlanWorkItem2GraphEdit.SizeColsToHeaders(Grid:TStringGrid);
var
  Col: integer;
begin
  for Col := 7 to (sgENPlanWorkItem2Graph.ColCount - 1) do
    sgENPlanWorkItem2Graph.ColWidths[Col] :=
      sgENPlanWorkItem2Graph.Canvas.TextWidth(Grid.Cells[Col, 0]) + 15;
end;

end.